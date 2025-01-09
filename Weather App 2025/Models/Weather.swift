//
//  Weather.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation

struct Weather: Decodable, Identifiable {
    var id: Int
    let main: CurrentCondition
    let description: String
    let icon: String
}
