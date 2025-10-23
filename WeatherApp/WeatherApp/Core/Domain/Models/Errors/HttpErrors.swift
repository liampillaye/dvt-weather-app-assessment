//
//  HttpErrors.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

enum HttpClientError: Error {
    case unauthorized
    case invalidUrl
    case networkError
    case notImplemented
}
