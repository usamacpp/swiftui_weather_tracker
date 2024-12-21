//
//  HomeViewModel.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/16/24.
//

import Foundation

enum HomeViewState {
    case noCurrentCity
    case hasCurrentCity(WeatherData?, Error?)
    case searching(WeatherData?, Error?)
}

class HomeViewModel: ObservableObject {
    @Published var currState: HomeViewState
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol, state: HomeViewState = .noCurrentCity) {
        self.networkManager = networkManager
        self.currState = state
    }
    
    @MainActor
    func getCurrentCity() async {
        guard let city = UserDefaults.standard.string(forKey: "currentCity") else {
            currState = .noCurrentCity
            return
        }
        
        let res = await cityWeather(name: city)
        currState = .hasCurrentCity(res.0, res.1)
    }
    
    @MainActor
    func setCurrentCity(name: String) async {
        UserDefaults.standard.set(name, forKey: "currentCity")
        await getCurrentCity()
    }
    
    @MainActor
    func searchCity(name: String) async {
        let res = await cityWeather(name: name)
        currState = .searching(res.0, res.1)
    }
    
    private func cityWeather(name: String) async -> (WeatherData?, Error?) {
        do {
            let res = try await networkManager.getWeatherData(city: name)
            print(String(data: res, encoding: .utf8) as Any)
            
            if let err = res.decode(responseType: WeatherTrackerError.self) {
                print(err)
                return (nil, SystemError.NetworkError.responseError)
            } else if let weather = res.decode(responseType: WeatherData.self) {
                print(weather)
                return (weather, nil)
            } else {
                return (nil, SystemError.DecoderError.invalidDecoding)
            }
        } catch {
            print(error)
            return (nil, error)
        }
    }
}
