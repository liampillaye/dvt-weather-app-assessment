//
//  Forecast.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ForecastView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image("SunnyBg")
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
                //TODO: Temp to get view rendering, Add ForEach to loop through 5Day Forecast results
                WeatherCard(dayOfWeek: "Monday", temperature: "20", iconName: "Sunny")
                WeatherCard(dayOfWeek: "Tuesday", temperature: "20", iconName: "Sunny")
                WeatherCard(dayOfWeek: "Wednesday", temperature: "20", iconName: "Sunny")
                WeatherCard(dayOfWeek: "Thursday", temperature: "20", iconName: "Sunny")
                WeatherCard(dayOfWeek: "Friday", temperature: "20", iconName: "Sunny")
                Spacer()
            }//:VSTACK
        }
        .onAppear {
            withAnimation(.easeInOut(duration:8).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    ForecastView()
}
