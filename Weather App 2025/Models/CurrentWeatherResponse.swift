//
//  CurrentWeatherResponse.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 7/1/2025.
//

import Foundation

struct CurrentWeatherResponse: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}
