//
//  URLs.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import CoreLocation

struct URLs {
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    static let appId = "d23516d0b2787144caf23421d5ec4515"
    
    static func currentWeatherUrl(location: CLLocationCoordinate2D) -> String {
        return baseUrl + "weather?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(appId)&units=metric"
    }
    
    static func forecastWeatherUrl(location: CLLocationCoordinate2D) -> String {
        return baseUrl + "forecast?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(appId)&units=metric"
    }
}
