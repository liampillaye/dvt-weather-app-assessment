//
//  MockForecast5Service.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

final class MockForecast5Service: Forecast5Service{
    func fetchForecast5(for lat: Double, lon: Double) async -> ForecastResponse {
        let bundle = Bundle(for: type(of: self))
        let forecastResponse: ForecastResponse = bundle.decode(Constants.Mocks.Forecast5.mockCapeTown5DayWeatherForecastFileName)
        return forecastResponse
    }
}

