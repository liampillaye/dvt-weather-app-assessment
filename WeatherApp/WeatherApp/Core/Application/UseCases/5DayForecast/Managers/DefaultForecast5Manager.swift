//
//  DefaultForecast5Manager.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

final class DefaultForecast5Manager: Forecast5Manager {
    
    //MARK: PRIVATES
    private(set) var service: Forecast5Service
    
    //MARK: INITS
    init(service: Forecast5Service) {
        self.service = service
    }
    
    //MARK: PROTOCOL
    func fetch5DayForecast(for lat: Double, lon: Double) async throws -> [Forecast] {
             
        do {
            let response = try await self.service.fetchForecast5(for: lat, lon: lon)
            
            var fiveDayWeatherForecast: [Forecast] = []
            let days = [0.0, 24, 48, 73, 96];
            
            for i in 0..<days.count {
                let filteredForecast = response.list.first {
                    return getForecastDateRangeBy(day: days[i]).contains(Date(timeIntervalSince1970: TimeInterval($0.dt)))
                }
                
                //TODO: Throw forecast not found exception here for possible edgecase
                guard let filteredForecast = filteredForecast else { continue }
                
                let forecast = Forecast.init(
                    dt: Date(timeIntervalSince1970: Double(filteredForecast.dt)),
                    temp: filteredForecast.main.temp,
                    weather: .init(weatherId: filteredForecast.weather.first?.id ?? -1,
                                   main: filteredForecast.weather.first?.main ?? MainEnumResponse.clear,
                                   description: filteredForecast.weather.first?.description ?? DescriptionResponse.clearSky,
                                   weatherIcon: filteredForecast.weather.first?.icon ?? ""),
                    pod: filteredForecast.sys.pod)
                
                fiveDayWeatherForecast.append(forecast)
            }
            
            return fiveDayWeatherForecast
        } catch {
            throw error
        }
    }
    
    func getForecastDateRangeBy(day: Double) -> Range<Date> {
        let date = day * 60.0 * 60.0
        let min = Date.now.addingTimeInterval(date)
        let max = min.addingTimeInterval(10800)
        return min..<max
    }
}

