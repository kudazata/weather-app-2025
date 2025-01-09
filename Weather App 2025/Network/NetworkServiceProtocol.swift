//
//  NetworkServiceProtocol.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func makeNetworkCall<T: Decodable>(urlString: String) -> AnyPublisher<T, NetworkError>
}
