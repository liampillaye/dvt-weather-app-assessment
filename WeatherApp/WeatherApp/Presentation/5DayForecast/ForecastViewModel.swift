//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor
public class ForecastViewModel: ObservableObject {
    
    private var manager: Forecast5Manager!
    
    @Published private(set) var forecasts: [Forecast] = []
    @Published private(set) var isBusy = false
    
    init(manager: Forecast5Manager) {
        self.manager = manager
    }
    
    func fetchForecast(for lat: Double, lon: Double) async {
        do {
            isBusy = true
            forecasts = try await manager.fetch5DayForecast(for: lat, lon: lon)
        } catch {
            isBusy = false
            print("Error fetching forecast: \(error)")
        }
    }
}
