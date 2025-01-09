//
//  MainViewModel.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 8/1/2025.
//

import Foundation
import Combine
import CoreLocation

class MainViewModel {
    
    var networkService: NetworkServiceProtocol
    var locationData: CLLocationCoordinate2D?
    var cancellables = Set<AnyCancellable>()
    let currentWeather = CurrentValueSubject<CurrentWeatherResponse?, Never>(nil)
    let forecastWeather = CurrentValueSubject<[ForecastWeatherItem], Never>([])
    let error = CurrentValueSubject<NetworkError?, Never>(nil)
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getCurrentWeather() {
        guard let location = locationData else { return }
        networkService.makeNetworkCall(urlString: URLs.currentWeatherUrl(location: location))
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error.send(error)
                }
        } receiveValue: { [weak self] (response: CurrentWeatherResponse) in
            self?.currentWeather.send(response)
        }.store(in: &cancellables)
    }
    
    func getForecastWeather() {
        guard let location = locationData else { return }
        networkService.makeNetworkCall(urlString: URLs.forecastWeatherUrl(location: location))
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    self?.error.send(error)
                }
            } receiveValue: { [weak self] (response: ForecastWeatherResponse) in
                let refinedList = self?.getUniqueDayForecastItems(items: response.list) ?? []
                self?.forecastWeather.send(refinedList)
            }.store(in: &cancellables)
    }
    
    /// A helper function that filters the forecast items returned from the backend and returns one for each day. It prefers taking the weather forecast for 12 noon, but if this is not available it will take the first forecase item for that day
    /// - Parameters:
    ///    - items: an array of forecast weather items returned from the backed
    /// - Returns: A filtered array of forecast weather items that contains only one forecast from each day
    func getUniqueDayForecastItems(items: [ForecastWeatherItem]) -> [ForecastWeatherItem] {
        var uniqueItems: [Date: ForecastWeatherItem] = [:]
        for item in items {
            if Calendar.current.isDateInToday(item.dtTxt) { continue }
            let day = Calendar.current.startOfDay(for: item.dtTxt)
            if Calendar.current.dateComponents([.hour], from: item.dtTxt).hour == 12 {
                uniqueItems[day] = item
            } else {
                if uniqueItems[day] == nil {
                    uniqueItems[day] = item
                }
            }
        }
        return uniqueItems.values.sorted { $0.dtTxt < $1.dtTxt }
    }
    
    var cityName: String {
        return currentWeather.value?.name ?? "---"
    }
    
    var currentTemperature: String {
        return (currentWeather.value?.main.temp.toStringWithZeroDecimalPlaces() ?? "--") + "°"
    }
    
    var minimumTemperature: String {
        return (currentWeather.value?.main.tempMin.toStringWithZeroDecimalPlaces() ?? "--") + "°"
    }
    
    var maximumTemperature: String {
        return (currentWeather.value?.main.tempMax.toStringWithZeroDecimalPlaces() ?? "--") + "°"
    }
    
    func currentCondition() -> String {
        return currentWeather.value?.weather[0].main.displayName ?? "---"
    }
    
    func backgroundImageName() -> String {
        return currentWeather.value?.weather[0].main.backgroundImageName ?? "sea_sunny"
    }
    
    func backgroundColorHexValue() -> Int {
        return currentWeather.value?.weather[0].main.backgroundColorHexValue ?? 0x4A90E2
    }
}
