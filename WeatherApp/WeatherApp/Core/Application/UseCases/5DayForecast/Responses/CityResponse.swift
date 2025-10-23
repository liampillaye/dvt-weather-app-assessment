//
//  City.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//


import Foundation

struct CityResponse: Codable {
    let id: Int
    let name: String
    let coord: CoordResponse
    let country: String
    let population, timezone, sunrise, sunset: Int
}
