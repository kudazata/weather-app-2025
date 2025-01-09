//
//  CurrentCondition.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation

enum CurrentCondition: String, Decodable {
    case cloudy = "Clouds"
    case rainy = "Rain"
    case clear = "Clear"
    
    var displayName: String {
        switch self {
        case .cloudy:
            "CLOUDY"
        case .rainy:
            "RAINY"
        case .clear:
            "SUNNY"
        }
    }
    
    var imageName: String {
        switch self {
        case .cloudy:
            "partlysunny"
        case .rainy:
            "rain"
        case .clear:
            "clear"
        }
    }
    
    var backgroundColorHexValue: Int {
        switch self {
        case .clear:
            0x4A90E2
        case .rainy:
            0x57575D
        case .cloudy:
            0x54717A
        }
    }
    
    var backgroundImageName: String {
        switch self {
        case .cloudy:
            "sea_cloudy"
        case .rainy:
            "sea_rainy"
        case .clear:
            "sea_sunny"
        }
    }
}
