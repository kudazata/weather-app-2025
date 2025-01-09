//
//  NetworkService.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 7/1/2025.
//

import Foundation
import Combine

struct NetworkService: NetworkServiceProtocol {
    
    /// Generic function to fetch data from the backend
    /// - Returns: A publisher that emits a response object or a NetworkError.
    func makeNetworkCall<T: Decodable>(urlString: String) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.setDateDecodingStrategy()
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.badRequest
                }
                let statusCode = httpResponse.statusCode
                if !(200...299).contains(statusCode) {
                    let backendError = try decoder.decode(BackendError.self, from: data)
                    throw NetworkError.backendError(backendError)
                }
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { error -> NetworkError in
                switch error {
                case let networkError as NetworkError:
                    return networkError
                default:
                    return NetworkError.customError(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
