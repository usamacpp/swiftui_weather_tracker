//
//  NetworkManager.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/15/24.
//

import Foundation

extension SystemError {
    enum NetworkError: Error {
        case invalidURL
        case noData
        case responseError
        case unknown
    }
}

protocol NetworkManagerProtocol {
    var baseURL: String { get }
    
    func getWeatherData(city: String) async throws -> Data
}

struct NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    let baseURL: String = "https://api.weatherapi.com/v1"
    let apiKey = "69646e38533a4068981193030241512"
    
    private init() {}
    
    func getWeatherData(city: String) async throws -> Data {
        let urlString = baseURL + "/current.json?key=\(apiKey)&q=\(city)&lang=en"
        
        guard let url = URL(string: urlString) else { throw SystemError.NetworkError.invalidURL }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        
        if let (data, _) = try? await URLSession.shared.data(for: request) {
            return data
        }
        
        throw SystemError.NetworkError.noData
    }
}
