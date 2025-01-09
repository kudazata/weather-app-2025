//
//  MainViewModelTests.swift
//  Weather App 2025Tests
//
//  Created by Kuda Zata on 9/1/2025.
//

import XCTest
import CoreLocation
@testable import Weather_App_2025

final class MainViewModelTests: XCTestCase {
    
    var sut: MainViewModel!
    var networkService: NetworkServiceMock!

    override func setUpWithError() throws {
        networkService = NetworkServiceMock()
        sut = MainViewModel(networkService: networkService)
        sut.locationData = CLLocationCoordinate2D(latitude: -26.2041028, longitude: 28.0473051)
    }

    override func tearDownWithError() throws {
        networkService = nil
        sut = nil
    }
    
    func testGetCurrentWeatherSuccess_ShouldPopulateCurrentWeather() {
        networkService.isCurrentWeather = true
        sut.networkService = networkService
        sut.getCurrentWeather()
        XCTAssertEqual(sut.currentCondition(), "CLOUDY")
    }
    
    func testGetCurrentWeatherFailure_ShouldPopulateError() {
        networkService.shouldFail = true
        sut.networkService = networkService
        sut.getCurrentWeather()
        XCTAssertEqual(sut.error.value?.message, Optional("The request that was sent is invalid"))
    }
    
    func testGetForecastWeatherSuccess_ShouldPopulateForecastWeather() {
        networkService.isCurrentWeather = false
        sut.networkService = networkService
        sut.getForecastWeather()
        XCTAssertEqual(sut.forecastWeather.value.count, 1)
    }
    
    func testGetForecastWeatherFailure_ShouldPopulateError() {
        networkService.shouldFail = true
        networkService.isCurrentWeather = false
        sut.networkService = networkService
        sut.getForecastWeather()
        XCTAssertEqual(sut.error.value?.message, Optional("The request that was sent is invalid"))
    }
    
    func testCityNameInitialValue() {
        XCTAssertEqual(sut.cityName, "---")
    }
    
    func testCurrentTemperatureInitialValue() {
        XCTAssertEqual(sut.currentTemperature, "--°")
    }
    
    func testMinimumTemperatureInitialValue() {
        XCTAssertEqual(sut.minimumTemperature, "--°")
    }
    
    func testMaximumTemperatureInitialValue() {
        XCTAssertEqual(sut.maximumTemperature, "--°")
    }
    
    func testCurrentConditionInitialValue() {
        XCTAssertEqual(sut.currentCondition(), "---")
    }
    
    func testBackgroundImageNameInitialValue() {
        XCTAssertEqual(sut.backgroundImageName(), "sea_sunny")
    }
    
    func testBackgroundColorInitialValue() {
        XCTAssertEqual(sut.backgroundColorHexValue(), 0x4A90E2)
    }

}
