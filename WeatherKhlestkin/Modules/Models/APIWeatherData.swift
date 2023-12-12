//
//  APIWeatherData.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import UIKit

struct APIWeatherData: Codable {
    let cod: String
    let message: Double
    let cnt: UInt
    let list: [WeatherList]
    let city: WeatherCity
}

struct WeatherList: Codable {
    let dt: Double
    let main: WeatherListMain
    let weather: [WeatherListWeather]
    let clouds: WeatherListClouds
    let wind: WeatherListWind
    let visibility: Int
    let dtTxt: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility
        case dtTxt = "dt_txt"
    }
}

struct WeatherListMain: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct WeatherListWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherListClouds: Codable {
    let all: Int
}

struct WeatherListWind: Codable {
    let speed: Double
    let deg: Double
}

struct WeatherCity: Codable {
    let id: Int
    let name: String
    let coord: WeatherCityCoord
    let country: String
    let timezone: Int
    let population: Int?
}

struct WeatherCityCoord: Codable {
    let lat: Double
    let lon: Double
}
