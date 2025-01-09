//
//  NetworkServiceMock.swift
//  Weather App 2025Tests
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import Combine
@testable import Weather_App_2025

struct NetworkServiceMock: NetworkServiceProtocol {
    
    var shouldFail = false
    var isCurrentWeather = true
    let weather = Weather(id: 1, main: CurrentCondition(rawValue: "Clouds")!, description: "", icon: "")
    let main = Main(temp: 25.7, tempMin: 23.2, tempMax: 26.9)
    let date = Calendar.current.date(byAdding: .day, value: 1, to: Date())
    
    func makeNetworkCall<T: Decodable>(urlString: String) -> AnyPublisher<T, NetworkError> {
        if shouldFail {
            return Fail(error: NetworkError.badRequest).eraseToAnyPublisher()
        } else {
            let currentWeatherResponse = CurrentWeatherResponse(name: "Harare", weather: [weather], main: main)
            let forecastWeatherItem = ForecastWeatherItem(dt: 993800, main: main, weather: [weather], dtTxt: date!)
            let forecastWeatherResponse = ForecastWeatherResponse(list: [forecastWeatherItem, forecastWeatherItem, forecastWeatherItem, forecastWeatherItem, forecastWeatherItem])
            
            if isCurrentWeather {
                return Just(currentWeatherResponse as! T)
                    .setFailureType(to: NetworkError.self)
                    .eraseToAnyPublisher()
            } else {
                return Just(forecastWeatherResponse as! T)
                    .setFailureType(to: NetworkError.self)
                    .eraseToAnyPublisher()
            }
        }
    }
}
