//
//  HttpClient.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

protocol HttpClient {
    func get<T: Response>(for urlString: String,
                          queryStringParams: [URLQueryItem]?) async throws -> T
}
