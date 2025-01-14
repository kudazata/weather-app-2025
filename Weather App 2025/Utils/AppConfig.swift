//
//  AppConfig.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 14/1/2025.
//

import Foundation

struct AppConfig {
    static var appID: String? {
        return Bundle.main.object(forInfoDictionaryKey: "APP_ID") as? String
    }
}
