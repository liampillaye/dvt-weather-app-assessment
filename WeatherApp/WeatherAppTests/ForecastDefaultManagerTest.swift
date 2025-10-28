//
//  ForecastDefaultManagerTest.swift
//  WeatherAppTests
//
//  Created by Liam Pillaye.
//

import XCTest

final class ForecastDefaultManagerTest: XCTestCase {
    
    private var mockService: Forecast5Service? = nil

    override func setUpWithError() throws {
        mockService = MockForecast5Service()
    }

    override func tearDownWithError() throws {
        mockService = nil
    }

    func testFetchFiveDayForecastWithCorrectDataOnly() async throws {
        //Arrange
        let defaultForecastManager: Forecast5Manager = DefaultForecast5Manager(service: mockService!)
        
        //Act
        let forecasts: [Forecast] = try await defaultForecastManager.fetch5DayForecast(for: 0.0, lon: 0.0)

        //Assert
        XCTAssertNotNil(forecasts)
        XCTAssertEqual(forecasts.count, 5)
    }
    
    func testForecastFirstItemDateTimeIsWithin3HourDateRange() async throws {
        //Arrange
        let defaultForecastManager: Forecast5Manager = DefaultForecast5Manager(service: mockService!)
        
        //Act
        let forecasts: [Forecast] = try await defaultForecastManager.fetch5DayForecast(for: 0.0, lon: 0.0)
        let now = Date.now
        let max3Hours = now.addingTimeInterval(10800)
        let dateRange = now..<max3Hours

        //Assert
        XCTAssertNotNil(forecasts)
        XCTAssertTrue(dateRange.contains(forecasts.first!.dt as Date))
    }
}
