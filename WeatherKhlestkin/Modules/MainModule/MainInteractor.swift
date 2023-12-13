//
//  MainInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func fetchWeatherData()
}

protocol MainInteractorOutputProtocol: AnyObject {
    func handleResult(_ response: APIWeatherData, cityName: String)
}

final class MainInteractor {
    
    weak var presenter: MainInteractorOutputProtocol!
    private let weatherService = WeatherService()
    
    private func fetchWeatherData(by city: String) {

        weatherService.fetchWeather(byCity: city) { result in
            switch result {
            case .success(let response):
                // TODO: Добавить работу с UserDefaults
                self.presenter?.handleResult(response, cityName: city)
            case .failure(let error): break
                debugPrint(error)
            }
        }
    }
    
    required init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension MainInteractor: MainInteractorProtocol {
    func fetchWeatherData() {
        fetchWeatherData(by: "Moscow")
    }
}
