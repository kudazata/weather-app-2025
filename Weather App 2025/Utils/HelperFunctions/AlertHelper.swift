//
//  AlertHelper.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 14/1/2025.
//

import Foundation
import UIKit

extension UIViewController {
    func showRetryAlert(title: String, message: String, completion: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "retry_button_title"), style: .default, handler: { action in
            completion()
        }))
        alert.addAction(UIAlertAction(title: String(localized: "cancel_button_title"), style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showGeneralAlert(title: String, message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "ok_button_title"), style: .default, handler: { action in
            completion?()
        }))
        present(alert, animated: true)
    }
}
