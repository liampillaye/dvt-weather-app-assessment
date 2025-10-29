# dvt-weather-app-assessment
DVT Weather App Assessment > Create a weather application to display a 5-day weather forecast

## Demo

Simulator Demo of the WeatherApp 

[Project Reference]()

---

## Features
- Clean SwiftUI + MVVM-C architecture
- Combine-based networking
- Dependency injection
- Storage & config management
- Modularized feature layers (Eligiblity, Products)
- Localization
- XCTest
- GitHub Actions CI/CD ready

---

## Requirements
- macOS 13+
- Xcode 16+
- Swift 5.6+
- iOS 18+
- Swift Package Manager for dependencies

---

## Getting Started
```bash
git clone git@github.com:liampillaye/dvt-weather-app-assessment.git
cd WeatherApp
open WeatherApp.xcodeproj
```

---

## Build & Run

Select WeatherApp scheme

Target a simulator (e.g. iPhone 16)

Cmd+R to launch

---

## Testing

Run all tests:

```bash
xcodebuild test -scheme WeatherApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

Includes:
Unit tests (business logic)

---

## Project Structure
```bash
WeatherApp/
 ├─ App/                  # AppDelegate, SceneDelegate
 ├─ Presentation/         # Views, ViewModels, & Common
 │   ├─ Common/
 │   └─ Forecasat/
 ├─ Core/                 # Business logic & Use cases
 │   ├─ Application/
 │   ├─ Domain/
 ├─ Infrastucture/        # Networking, Persistence
 │   ├─ Infrastucture/
 │   ├─ Persistence/
 ├─ Assets/               # Images, Icons
 ├─ Tests/                # XCTest & mocks
```

---

## Contributing 

Fork & branch ```(feature/my-feature)```

Write tests, docs

Submit PR with descriptive commits

---

## CHANGELOG.md

[CHANGELOG.md](CHANGELOG.md)

### Version 1.0.0 - 2025-10-29
### Added
* Project Scaffolding using Clean Architecture
* Handcrafted IoCContainer (including register & resolver) implementation.
* Created 5 Day (3hour) Forecast View
* Created 5 Day (3hour) Forecast ViewModel
* Created HttpClient and DefaultHttpClient to introspect the downstream services.
* Created MockForecast5Service along with seeded CapeTown5DayWeatherForecast for Mock Data
* Create Error Handling for HttpErorrStatuses, Data Mapping, and Improved UX.
* Added ViewModel Unit Test for improved test coverage
* Added DefaultForecast5Manager Unit Test for improved test coverage