//
//  MainViewController+constraints.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 8/1/2025.
//

import Foundation
import UIKit
import SwiftUI

extension MainViewController {
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(cityNameLabel)
        view.addSubview(mainTempLabel)
        view.addSubview(currentConditionLabel)
        view.addSubview(minTempLabel)
        view.addSubview(minTempTitleLabel)
        view.addSubview(currentTempLabel)
        view.addSubview(currentTempTitleLabel)
        view.addSubview(maxTempLabel)
        view.addSubview(maxTempTitleLabel)
        view.addSubview(dividerView)
        minTempTitleLabel.text = String(localized: "min")
        currentTempTitleLabel.text = String(localized: "current")
        maxTempTitleLabel.text = String(localized: "max")
        minTempTitleLabel.addSpacing(value: 2)
        currentTempTitleLabel.addSpacing(value: 2)
        maxTempTitleLabel.addSpacing(value: 2)
    }
    
    func setupConstraints() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentConditionLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTempLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTempTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            ///city name
            cityNameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ///main temp label
            mainTempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10),
            mainTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ///current condition label
            currentConditionLabel.topAnchor.constraint(equalTo: mainTempLabel.bottomAnchor, constant: 10),
            currentConditionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ///background image
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            
            ///min temp label
            minTempLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 5),
            minTempLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            ///min temp title label
            minTempTitleLabel.topAnchor.constraint(equalTo: minTempLabel.bottomAnchor, constant: 0),
            minTempTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            ///current temp label
            currentTempLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 5),
            currentTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ///current temp title label
            currentTempTitleLabel.topAnchor.constraint(equalTo: currentTempLabel.bottomAnchor, constant: 0),
            currentTempTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ///max temp label
            maxTempLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 5),
            maxTempLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ///max temp title label
            maxTempTitleLabel.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 0),
            maxTempTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ///divider view
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            dividerView.topAnchor.constraint(equalTo: minTempTitleLabel.bottomAnchor, constant: 8),
        ])
    }
}
