//
//  Forecast.swift
//  WeatherApp
//
//  Created by Liam Pillaye
//

import Foundation

struct Forecast: Codable, Identifiable {
    var id = UUID()
    let dt: Date
    let temp: Double
    let weather: Weather
    let pod: PodResponse
}

struct Weather: Codable {
    let weatherId: Int
    let main: MainEnumResponse
    let description: DescriptionResponse
    let weatherIcon: String
}

extension Weather {
    var backgroundImage: String {
        switch main {
        case .clouds:
            return "CloudyBg"
        case .rain:
            return "RainyBg"
        default:
            return "SunnyBg"
        }
    }
}

