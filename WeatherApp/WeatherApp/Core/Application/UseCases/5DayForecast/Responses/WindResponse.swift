//
//  WindResponse.swift
//  WeatherApp
//
//  Created by Liam Pillaye on 2025/10/23.
//

import Foundation

struct WindResponse: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
