//
//  Constants.swift
//  WeatherApp
//
//  Created by Liam Pillaye
//

enum Constants {
    
    enum API {
        static let baseURLString = "https://api.openweathermap.org/data/2.5/"
        static let apiKey = "88ba347a99d6de96cd49483895afa0e6"
        static let forecast5Path = "forecast5"
        static let units = "metric"
    }
        
    enum Mocks {
        enum Forecast5 {
            static let mockCapeTown5DayWeatherForecastFileName = "CapeTown5DayWeatherForecast.json"
        }
    }
}
