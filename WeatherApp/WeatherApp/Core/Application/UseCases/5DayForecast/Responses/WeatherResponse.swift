//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

struct WeatherResponse: Codable {
    let id: Int
    let main: MainEnumResponse
    let description: DescriptionResponse
    let icon: String
}
