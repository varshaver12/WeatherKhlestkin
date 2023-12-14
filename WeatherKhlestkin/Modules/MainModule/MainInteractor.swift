//
//  MainInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation
import MapKit

protocol MainInteractorProtocol: AnyObject {
    func fetchWeatherData()
    func fetchInitialWeatherData()
}

protocol MainInteractorOutputProtocol: AnyObject {
    func handleResult(_ response: APIWeatherData, cityName: String)
}

final class MainInteractor: NSObject {
    
    weak var presenter: MainInteractorOutputProtocol!
    private let weatherService = WeatherService()
    
    private let locationManager = CLLocationManager()
    
    private func fetchWeatherData(locationName: String, locationLatitude: Double, locationLongitude: Double) {
        self.weatherService.fetchWeather(lat: locationLatitude, lon: locationLongitude) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.handleResult(response, cityName: locationName)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            
            guard let longitude: Double = locationManager.location?.coordinate.longitude else { return }
            guard let latitude: Double = locationManager.location?.coordinate.latitude else { return }
            
            self.weatherService.fetchWeather(lat: latitude, lon: longitude) { [weak self] result in
                guard let `self` = self else { return }
                switch result {
                case .success(let response):
                    DataManager.shared.saveCityName(for: "locationName", with: response.city.name)
                    DataManager.shared.saveCoord(for: "locationLatitude", with: latitude)
                    DataManager.shared.saveCoord(for: "locationLongitude", with: longitude)
                    self.presenter?.handleResult(response, cityName: response.city.name)
                case .failure(let error):
                    debugPrint(error)
                }
            }
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            // TODO: Добавить alert
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            // Разрешена геолокация
            break
        @unknown default:
            break
        }
    }
    
    required init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
}


extension MainInteractor: MainInteractorProtocol {
    func fetchInitialWeatherData() {
        checkLocationServices()
    }
    
    func fetchWeatherData() {
        let locationName = DataManager.shared.loadCityName(for: "locationName")
        let locationLatitude = DataManager.shared.loadCoord(for: "locationLatitude")
        let locationLongitude = DataManager.shared.loadCoord(for: "locationLongitude")
        
        fetchWeatherData(locationName: locationName, locationLatitude: locationLatitude, locationLongitude: locationLongitude)
    }
}

extension MainInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
