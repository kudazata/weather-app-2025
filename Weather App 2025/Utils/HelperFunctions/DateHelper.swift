//
//  DateHelper.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 14/1/2025.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
