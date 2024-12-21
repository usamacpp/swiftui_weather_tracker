//
//  Extensions.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/16/24.
//

import SwiftUI

extension Color {
    init(hex: UInt, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    init(grayHex: UInt8, opacity: Double = 1.0) {
        let gray = Double(grayHex) / 255.0
        self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: opacity)
    }
}

extension Color {
    static let searchbarForeground: Color = .init(grayHex: 0xC4)
    static let searchbarBackground: Color = .init(grayHex: 0xF2)
    static let tilesBackground: Color = .init(grayHex: 0xF2)
    static let lightBlack: Color = .init(grayHex: 0x9A)
    static let veryLightBlack: Color = .init(grayHex: 0xC4)
}

extension Font {
    enum PoppinsFont {
        case regular
        case medium
        case semiBold
        case bold
        case light
        
        var value: String {
            switch self {
            case .regular:
                return "Poppins-Regular"
            case .medium:
                return "Poppins-Medium"
            case .semiBold:
                return "Poppins-SemiBold"
            case .bold:
                return "Poppins-Bold"
            case .light:
                return "Poppins-Light"
            }
        }
    }
    
    static func poppins(_ type: PoppinsFont, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
}
