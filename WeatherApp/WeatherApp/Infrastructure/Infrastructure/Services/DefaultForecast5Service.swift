//
//  DefaultForecast5Service.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

final class DefaultForecast5Service: Forecast5Service {
    
    //MARK: PRIVATES
    private var httpClient: HttpClient!
    
    //MARK: INITS
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    //MARK: PUBLIC FUNCS
    func fetchForecast5(for lat: Double, lon: Double) async throws -> ForecastResponse {
        
        do {
            let queryStringParameters = [
                URLQueryItem(name: Constants.API.latParameter, value: "\(lat)"),
                URLQueryItem(name: Constants.API.lonParameter, value: "\(lon)"),
                URLQueryItem(name: Constants.API.appidParameter, value: Constants.API.apiKey),
                URLQueryItem(name: Constants.API.unitsParameter, value: Constants.API.units)]
            
            let response = try await httpClient.get(for: Constants.API.baseURLString + Constants.API.forecast5Path, queryStringParams: queryStringParameters) as ForecastResponse
            
            return response
        } catch {
            throw error
        }
    }
}
