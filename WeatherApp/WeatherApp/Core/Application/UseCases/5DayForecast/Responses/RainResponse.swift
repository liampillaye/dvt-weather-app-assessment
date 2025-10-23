//
//  Rain.swift
//  WeatherApp
//
//  Created by Liam Pillaye on 2025/10/23.
//


import Foundation

struct RainResponse: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
