//
//  DescriptionResponse.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

enum DescriptionResponse: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}
