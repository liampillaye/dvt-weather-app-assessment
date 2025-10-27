//
//  Forecast5Service.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

protocol Forecast5Service {
    func fetchForecast5(for lat: Double, lon: Double) async throws -> ForecastResponse
}

