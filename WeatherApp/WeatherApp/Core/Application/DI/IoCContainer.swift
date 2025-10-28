//
//  IoCContainer.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import Foundation

final class IoCContainer {
    
    private static var factories: [String: () -> Any] = [:]
    
    static func registerDependencies() {
        
        //MARK: MANAGERS
        register { DefaultForecast5Manager(service: resolve()) as Forecast5Manager }

        //MARK: HttpClient
        register { DefaultHttpClient() as HttpClient }

        
        //MARK: SERVICES
        register { DefaultForecast5Service(httpClient: resolve()) as Forecast5Service }

        
        //MARK:VIEWMODELS
        register { @MainActor in
            ForecastViewModel(manager: resolve())
        }

    }
    
    static func register<T>(_ factory: @escaping () -> T) {
        let key = String(describing: T.self)
        factories[key] = factory as () -> Any
    }
    
    static func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let factory = factories[key], let value = factory() as? T else {
            fatalError("No registration for " + key)
        }
        return value
    }
}
