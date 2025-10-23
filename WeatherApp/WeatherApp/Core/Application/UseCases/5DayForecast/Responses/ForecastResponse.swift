//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

struct ForecastResponse: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ListResponse]
    let city: CityResponse
}




