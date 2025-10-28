//
//  ForecastViewModelTest.swift
//  WeatherAppTests
//
//  Created by Liam Pillaye.
//

import XCTest
import CoreLocation

final class ForecastViewModelTest: XCTestCase {
    
    private var forecastManager: Forecast5Manager? = nil
    private var mockForecastService: Forecast5Service? = nil
//    @MainActor private var viewModel: ForecastViewModel? = nil

    override func setUpWithError() throws {
        mockForecastService = MockForecast5Service()
        forecastManager = DefaultForecast5Manager(service: mockForecastService!)
    }

    override func tearDownWithError() throws {
        mockForecastService = nil
        forecastManager = nil
    }

    @MainActor func testFetchFiveDayForecastWithFiltered5CountOnly() async throws {
               
        //Arrange
        let viewModel: ForecastViewModel? = ForecastViewModel(manager: forecastManager!)
        
        //Act
        viewModel?.coordinate = CLLocationCoordinate2D(latitude: 32.6514, longitude: -161.4333)
        await viewModel?.fetchForecast()
        
        //Assert
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel?.forecasts.count, 5)
    }
    
    @MainActor func testValidateFiveDayBackgroundImagesMapped() async throws {
        //Arrange
        let viewModel: ForecastViewModel? = ForecastViewModel(manager: forecastManager!)
        
        //Act
        await viewModel?.fetchForecast()
        
        //Assert
        XCTAssertNotNil(viewModel)
        XCTAssert(((viewModel?.forecasts.forEach {
            XCTAssertNotNil($0.weather.backgroundImage)
        }) != nil))
    }
}
