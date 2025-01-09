//
//  Main.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation

struct Main: Decodable {
    var id: UUID? = UUID()
    let temp: Double
    let tempMin: Double
    let tempMax: Double
}
