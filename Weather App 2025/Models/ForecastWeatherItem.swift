//
//  ForecastWeatherItem.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation

struct ForecastWeatherItem: Decodable, Identifiable {
    var id: UUID? = UUID()
    let dt: Int
    let main: Main
    let weather: [Weather]
    let dtTxt: Date
}
