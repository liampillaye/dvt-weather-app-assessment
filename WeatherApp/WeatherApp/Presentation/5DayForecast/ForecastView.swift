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
        Image("SunnyBg")
            .resizable()
            .scaledToFit()
            .scaleEffect(isAnimating ? 1.4 : 1.2)
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
