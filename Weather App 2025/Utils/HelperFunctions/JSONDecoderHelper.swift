//
//  JSONDecoderHelper.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 14/1/2025.
//

import Foundation

extension JSONDecoder {
    func setDateDecodingStrategy() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.dateDecodingStrategy = .formatted(dateFormatter)
    }
}
