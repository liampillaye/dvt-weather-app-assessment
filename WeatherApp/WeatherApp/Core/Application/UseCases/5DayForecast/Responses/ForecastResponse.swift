//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

public struct ForecastResponse: Codable, Response{
    let cod: String
    let message, cnt: Int
    let list: [ListResponse]
    let city: CityResponse
}




