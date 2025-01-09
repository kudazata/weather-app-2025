//
//  MainViewController.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 7/1/2025.
//

import UIKit
import CoreLocation
import Combine
import SwiftUI

class MainViewController: UIViewController {
    
    let cityNameLabel = UILabel()
    let mainTempLabel = UILabel()
    let currentConditionLabel = UILabel()
    let backgroundImageView = UIImageView()
    let minTempLabel = UILabel()
    let minTempTitleLabel = UILabel()
    let currentTempLabel = UILabel()
    let currentTempTitleLabel = UILabel()
    let maxTempLabel = UILabel()
    let maxTempTitleLabel = UILabel()
    let dividerView = UIView()
    var forecastListView = UIView()
    
    let locationManager = CLLocationManager()
    let viewModel = MainViewModel()
    var cancellables = Set<AnyCancellable>()
    var didFetchLocation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyStyling()
        setupConstraints()
        locationManager.delegate = self
        displayCurrentWeather()
        bindViewModel()
    }
    
    func displayCurrentWeather() {
        cityNameLabel.text = viewModel.cityName
        mainTempLabel.text = viewModel.currentTemperature
        currentConditionLabel.text = viewModel.currentCondition()
        minTempLabel.text = viewModel.minimumTemperature
        currentTempLabel.text = viewModel.currentTemperature
        maxTempLabel.text = viewModel.maximumTemperature
        backgroundImageView.image = UIImage(named: viewModel.backgroundImageName())
        view.backgroundColor = UIColor(rgb: viewModel.backgroundColorHexValue())
        
        UIView.transition(with: backgroundImageView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            self.backgroundImageView.image = UIImage(named: self.viewModel.backgroundImageName())
        })
        cityNameLabel.addSpacing(value: 2)
        mainTempLabel.addSpacing(value: 2)
        currentConditionLabel.addSpacing(value: 2)
        minTempLabel.addSpacing(value: 2)
        currentTempLabel.addSpacing(value: 2)
        maxTempLabel.addSpacing(value: 2)
    }
    
    func displayForecastWeather() {
        let controller = UIHostingController(rootView: ForecastListView(forecastWeatherItems: viewModel.forecastWeather.value))
        if let listView = controller.view {
            self.forecastListView = listView
            view.addSubview(forecastListView)
            forecastListView.translatesAutoresizingMaskIntoConstraints = false
            listView.backgroundColor = .clear
            forecastListView.backgroundColor = .clear
            NSLayoutConstraint.activate([
                forecastListView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                forecastListView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                forecastListView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
                forecastListView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
            ])
        }
    }
    
    func bindViewModel() {
        viewModel.currentWeather.sink { [weak self] currentWeather in
            guard currentWeather != nil else { return }
            self?.displayCurrentWeather()
        }.store(in: &cancellables)
        
        viewModel.forecastWeather.sink { [weak self] forecastWeatherItems in
            guard forecastWeatherItems.count > 0 else { return }
            self?.displayForecastWeather()
        }.store(in: &cancellables)
        
        viewModel.error.sink { [weak self] error in
            guard let error = error else { return }
            self?.showRetryAlert(title: "Error", message: error.message, completion: {
                self?.viewModel.getCurrentWeather()
                self?.viewModel.getForecastWeather()
            })
        }.store(in: &cancellables)
    }
}
