//
//  Forecast.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI
import CoreLocationUI

struct ForecastView: View {
    
    @State private var isAnimating = false
    @State private var isLoading = true
    
    @StateObject var locationManager = LocationManager()
    @StateObject var viewModel: ForecastViewModel
    
    //MARK: - PRIVATE FUNCTIONS
    @discardableResult private func fetchForecast() {
        Task {
            await viewModel.fetchForecast(for: 33.9221, lon: 18.4231)
            isLoading = !viewModel.isBusy

//            if let coordinate = locationManager.lastKnownLocation {
//                await viewModel.fetchForecast(for: coordinate.latitude, lon: coordinate.longitude)
//                isLoading = !viewModel.isBusy
//            } else {
//                //Default to Cape Town if permissions denied
//                await viewModel.fetchForecast(for: 33.9221, lon: 18.4231)
//                isLoading = !viewModel.isBusy
//            }
        }
    }
    
    //MARK: BODY
    var body: some View {
        ZStack {
            Image(viewModel.forecasts.first?.weather.backgroundImage ?? "SunnyBg")
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1.4 : 1.2)
            VStack {
                HStack {
                    Text("5 Day Forecast")
                        .padding(.leading)
                        .headingPoppinsBoldStyle()
                    Spacer()
                }//:HSTACK
                Divider()
                    .frame(height: 1)
                    .background(Color.white)
                    .padding(.bottom)
                
                ForEach(viewModel.forecasts, id: \.id) { forecast in
                    WeatherCard(dayOfWeek: forecast.dt,
                                temperature: forecast.temp,
                                iconName: forecast.weather.weatherIcon, isLoading: $isLoading)
                }
                
                Spacer()
            }//:VSTACK
        }
        .onAppear {
            //            viewModel.requestPermissions()
            if locationManager.authorizationStatus == .notDetermined {
                locationManager.requestLocationAuthorization()
            }

            withAnimation(.easeInOut(duration:8).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
            
        }
        .onReceive(locationManager.$authorizationStatus) { authorisationStatus in
            switch authorisationStatus {
            case .notDetermined:
                print("request permission")
            case .authorizedAlways, .authorizedWhenInUse:
                Task {
                    await fetchForecast()
                }
                break;
            case .restricted, .denied:
                print("do nothing")
            @unknown default:
                print("do nothing")
            }
        }
        .onDisappear {
            //            viewModel.stopUpdatingLocation()
        }
    }
}

#Preview {
    struct Preview: View {
        
        let vm = ForecastViewModel(manager: IoCContainer.resolve())
        
        var body: some View {
            ForecastView(viewModel: vm)
        }
    }
    
    return Preview()
}
