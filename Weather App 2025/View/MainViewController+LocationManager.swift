//
//  MainViewController+LocationManager.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 9/1/2025.
//

import Foundation
import CoreLocation

extension MainViewController: CLLocationManagerDelegate {
    func checkLocationPermissionStatus() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            showGeneralAlert(title: "Location permission required", message: "In order to display your weather info, this app needs access to your location. Please enable this in your device's Settings", completion: nil)
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !didFetchLocation {
            self.didFetchLocation.toggle()
            viewModel.locationData = locations[0].coordinate
            viewModel.getCurrentWeather()
            viewModel.getForecastWeather()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationPermissionStatus()
    }
}
