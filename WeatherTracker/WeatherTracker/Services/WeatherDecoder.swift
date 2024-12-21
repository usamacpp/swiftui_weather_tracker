//
//  WeatherDecoderProtocol.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/16/24.
//

import Foundation

extension SystemError {
    enum DecoderError: Error {
        case invalidDecoding
    }
}

protocol WeatherDecoderProtocol {
    func decode<T: Decodable>(from data: Data, responseType: T.Type) -> T?
}

extension WeatherDecoderProtocol {
    func decode<T: Decodable>(from data: Data, responseType: T.Type) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

extension Data: WeatherDecoderProtocol {
    func decode<T: Decodable>(responseType: T.Type) -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
