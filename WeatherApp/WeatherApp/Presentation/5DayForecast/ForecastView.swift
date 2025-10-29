//
//  Forecast.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI
import CoreLocationUI

struct ForecastView: View {
    
    //MARK: PRIVATES
    @State private var isAnimating = false
    @State private var isLoading = true
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @StateObject var viewModel: ForecastViewModel
    
    //MARK: BODY
    var body: some View {
        ZStack {
            Image(viewModel.forecasts.first?.weather.backgroundImage ?? Constants.FiveDayForecast.defaultBackgoundImageName)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimating ? 1.4 : 1.2)
            VStack {
                HStack {
                    Text(Constants.FiveDayForecast.title)
                        .padding(.leading)
                        .safeAreaPadding(.top)
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
            if viewModel.authorizationStatus == .notDetermined {
                viewModel.requestPermissions()
            }
            
            withAnimation(.easeInOut(duration:8).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
            
        } //:ONAPPEAR
        .onReceive(viewModel.$authorizationStatus) { authorisationStatus in
            switch authorisationStatus {
            case .notDetermined:
                print("request permission")
            case .authorizedAlways, .authorizedWhenInUse:
                Task {
                    try? await Task.sleep(nanoseconds: 2_000_000_000)
                    await viewModel.fetchForecast()
                    isLoading = viewModel.isBusy
                }
                break;
            case .restricted, .denied:
                print("do nothing")
            @unknown default:
                print("do nothing")
            }
        }//:ONRECEIVE
        .onReceive(viewModel.$showError, perform: { showError in
            if showError {
                showErrorAlert = showError
                errorMessage = viewModel.errorMessage
            }
        })
        .onDisappear {
            viewModel.stopUpdatingLocation()
        }//ONDISAPEAR
        .alert(Constants.FiveDayForecast.alertTitle, isPresented: $showErrorAlert) {
            Button(Constants.FiveDayForecast.alertRetryButtonTitle) {
                Task {
                    await viewModel.fetchForecast()
                }
            }
            Button(Constants.FiveDayForecast.alertCancelButtonTitle) {
                //Do nothing
            }
        } message: {
            Text("\(errorMessage)")
        }
    }//:BODY
}

//MARK: PREVIEW
#Preview {
    struct Preview: View {
        
        let vm = ForecastViewModel(manager: IoCContainer.resolve())
        
        var body: some View {
            ForecastView(viewModel: vm)
        }
    }
    
    return Preview()
}
