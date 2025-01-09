//
//  MainViewController+styling.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import UIKit

extension MainViewController {
    func applyStyling() {
        view.backgroundColor = UIColor(rgb: 0x47AB2F)
        
        cityNameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        cityNameLabel.textColor = .white
        
        mainTempLabel.font = .systemFont(ofSize: 50, weight: .bold)
        mainTempLabel.textColor = .white
        
        currentConditionLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        currentConditionLabel.textColor = .white
        
        minTempLabel.font = .systemFont(ofSize: 20, weight: .medium)
        minTempLabel.textColor = .white
        
        minTempTitleLabel.font = .systemFont(ofSize: 16, weight: .light)
        minTempTitleLabel.textColor = .white
        
        currentTempLabel.font = .systemFont(ofSize: 20, weight: .medium)
        currentTempLabel.textColor = .white
        
        currentTempTitleLabel.font = .systemFont(ofSize: 16, weight: .light)
        currentTempTitleLabel.textColor = .white
        
        maxTempLabel.font = .systemFont(ofSize: 20, weight: .medium)
        maxTempLabel.textColor = .white
        
        maxTempTitleLabel.font = .systemFont(ofSize: 16, weight: .light)
        maxTempTitleLabel.textColor = .white
        
        dividerView.backgroundColor = .white
    }
}
