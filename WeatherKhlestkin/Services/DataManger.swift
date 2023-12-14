//
//  DataManger.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 14.12.2023.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveCityName(for keyForActualCity: String, with cityName: String) {
        userDefaults.set(cityName, forKey: keyForActualCity)
    }
    
    func saveCoord(for keyCoord: String, with coord: Double) {
        userDefaults.set(coord, forKey: keyCoord)
    }
    
    func loadCityName(for keyForActualCity: String) -> String {
        return userDefaults.string(forKey: keyForActualCity) ?? "Москва"
    }
    
    func loadCoord(for keyCoord: String) -> Double {
        return userDefaults.double(forKey: keyCoord)
    }
}
