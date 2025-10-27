//
//  Forecast.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ForecastView: View {
    
    @State private var isAnimating = false
    @StateObject var viewModel: ForecastViewModel

    
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
                                iconName: forecast.weather.weatherIcon)
                }
                
                Spacer()
            }//:VSTACK
        }
        .onAppear {
            Task {
                await viewModel.fetchForecast(for: 33.9221, lon: 18.4231)
            }
            withAnimation(.easeInOut(duration:8).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
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
    
    return Preview()}
