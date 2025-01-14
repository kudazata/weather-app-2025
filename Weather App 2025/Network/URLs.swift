//
//  URLs.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import CoreLocation

struct URLs {
    
    private static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    
    static func currentWeatherUrl(location: CLLocationCoordinate2D) -> String {
        return getUrl(type: "weather", location: location)
    }
    
    static func forecastWeatherUrl(location: CLLocationCoordinate2D) -> String {
        return getUrl(type: "forecast", location: location)
    }
    
    private static func getUrl(type: String, location: CLLocationCoordinate2D) -> String {
        var components = URLComponents(string: baseUrl + type)
        components?.queryItems = [
            URLQueryItem(name: "lat", value: "\(location.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.longitude)"),
            URLQueryItem(name: "appid", value: AppConfig.appID),
            URLQueryItem(name: "units", value: "metric"),
        ]
        return components?.url?.absoluteString ?? ""
    }
}
