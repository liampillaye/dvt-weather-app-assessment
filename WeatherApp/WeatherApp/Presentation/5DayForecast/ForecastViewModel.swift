//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation
import CoreLocation

@MainActor final class ForecastViewModel: NSObject, @preconcurrency CLLocationManagerDelegate, ObservableObject {
    
    // MARK: PROPS
    private var manager: Forecast5Manager!
    private var locationManager: CLLocationManager = CLLocationManager()
    
    //MARK: PUBLISHED
    @Published private(set) var forecasts: [Forecast] = skeletonForecast
    @Published private(set) var isBusy = false
    @Published private(set) var showError: Bool = false
    @Published private(set) var errorMessage = ""
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
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
    func fetchForecast() async {
        do {
            isBusy = true
            if let coordinate = coordinate {
                forecasts = try await self.manager.fetch5DayForecast(for: coordinate.latitude, lon: coordinate.longitude)
            }
            isBusy = false
        } catch {
            self.errorMessage = error.localizedDescription
            showError = true
        }
    }
    
    //MARK: CLLOCATION DELEGATES
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.first
        coordinate = lastSeenLocation?.coordinate
    }
}
