//
//  Forecast5Manager.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

protocol Forecast5Manager {
    func fetch5DayForecast(for lat: Double, lon: Double) async throws -> [Forecast]
}

