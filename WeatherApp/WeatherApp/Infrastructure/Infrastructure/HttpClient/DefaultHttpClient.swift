//
//  DefaultHttpClient.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

class DefaultHttpClient: HttpClient {
    
    //MARK: PUBLIC FUNCTIONS

    public func get<T: Response>(for urlString: String, queryStringParams: [URLQueryItem]?) async throws -> T {

        guard var url = URL(string: urlString) else {
            throw HttpClientError.invalidUrl
        }
        
        if let params = queryStringParams {
            url.append(queryItems: params)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return try await perform(for: request)
    }
    
    //MARK: PRIVATE FUNCTIONS
    
    private func perform<T: Response>(for request: URLRequest) async throws -> T {
        let (data, resp) = try await URLSession.shared.data(for: request)
        
        guard (resp as? HTTPURLResponse)?.statusCode == 200 else
        {
            throw HttpClientError.networkError
        }
        
        let response = try JSONDecoder().decode(T.self, from:data)
        return response

    }
}
