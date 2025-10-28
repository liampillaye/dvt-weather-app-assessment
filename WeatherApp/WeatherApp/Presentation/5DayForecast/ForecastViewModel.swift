//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation
import CoreLocation

@MainActor final class ForecastViewModel: NSObject, @preconcurrency CLLocationManagerDelegate, ObservableObject {
    
    //MARK: PROPS
    private var manager: Forecast5Manager!
    private var locationManager: CLLocationManager = CLLocationManager()
    
    @Published private(set) var forecasts: [Forecast] = []
    @Published private(set) var isBusy = false
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var lastSeenLocation: CLLocation?
    @Published var coordinate: CLLocationCoordinate2D?

    //MARK: INITS
    init(manager: Forecast5Manager) {
        self.manager = manager
        super.init()
        self.locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //MARK: PRIVATE FUNCS
    func requestPermissions() {
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
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
    
    //MARK: LOCATION DELEGATES
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        authorisationStatus = manager.authorizationStatus
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lastSeenLocation = locations.first
//        coordinate = lastSeenLocation?.coordinate
//    }
}
