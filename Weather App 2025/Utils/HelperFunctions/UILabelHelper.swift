//
//  UILabelHelper.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 14/1/2025.
//

import Foundation
import UIKit

extension UILabel {
    func addSpacing(value: Double) {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
