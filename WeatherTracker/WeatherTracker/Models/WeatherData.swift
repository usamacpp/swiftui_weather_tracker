//
//  WeatherData.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/15/24.
//

import Foundation

struct WeatherTrackerError: Decodable {
    struct WeatherTrackerErrorDetails: Decodable {
        let code: UInt
        let message: String
    }
    
    let error: WeatherTrackerErrorDetails
}

struct WeatherData: Decodable {
    struct Location: Decodable {
        let name: String
    }
    
    struct Current: Decodable {
        struct Condition: Decodable {
            let text: String
            let icon: String
        }
        
        let condition: Condition
        let temp_f: Double
        let feelslike_f: Double
        let humidity: Double
        let uv: Double
    }
    
    let location: Location
    let current: Current
    
    func currentConditionIconUrl() -> URL? {
        URL(string: "https:" + current.condition.icon)
    }
}
