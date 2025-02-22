//
//  BackendError.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation

struct BackendError: Decodable {
    let cod: Int
    let message: String
}
