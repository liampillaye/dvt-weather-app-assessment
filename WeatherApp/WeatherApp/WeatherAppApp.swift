//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    init() {
        IoCContainer.registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            let viewModel: ForecastViewModel = IoCContainer.resolve()

            ForecastView(viewModel: viewModel)
        }
    }
}
