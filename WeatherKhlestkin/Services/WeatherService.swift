//
//  WeatherService.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import Foundation

class WeatherService {
    
    private let urlString = "https://api.openweathermap.org/data/2.5/forecast"
    private let apiKey = "e16ad2ad4f6249dd11aa780e8c04528b"
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<APIWeatherData, WeatherServiceError>) -> Void) {
        
        var urlComponent = URLComponents(string: urlString)
        
        urlComponent?.queryItems = [
            URLQueryItem(name: "APPID", value: "\(apiKey)"),
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(lon)"),
            URLQueryItem(name: "units", value: "metric")
        ]

        guard let url = urlComponent?.url else { return }
        handleRequest(url: url, completion: completion)
    }
    
    func handleRequest(url: URL, completion: @escaping (Result<APIWeatherData, WeatherServiceError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                return completion(.failure(.clientError))
            }
            
            guard let data = data else {
                return completion(.failure(.noData))
            }
            
            do {
                let result = try JSONDecoder().decode(APIWeatherData.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        task.resume()
    }
}
