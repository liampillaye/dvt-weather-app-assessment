//
//  List.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//


import Foundation

struct ListResponse: Codable {
    let dt: Int
    let main: MainResponse
    let weather: [WeatherResponse]
    let clouds: CloudsResponse
    let wind: WindResponse
    let visibility: Int
    let pop: Double
    let sys: SysResponse
    let dtTxt: String
    let rain: RainResponse?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}
