//
//  ReadingView.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/19/24.
//

import SwiftUI

struct ReadingView: View {
    let title: String
    let reading: String
    let unit: String?
    
    var body: some View {
        VStack {
            readingTitle
            HStack {
                readingValue
                if let readingUnit {
                    readingUnit
                }
            }
            .foregroundColor(.lightBlack)
        }
        .padding()
    }
    
    private var readingTitle: Text {
        Text(title)
            .font(.title3)
            .fontWeight(.regular)
            .foregroundColor(.veryLightBlack)
    }
    
    private var readingValue: Text {
        Text(reading)
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
    
    private var readingUnit: Text? {
        if let unit {
            return Text(unit)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        
        return nil
    }
}

#Preview {
    ReadingView(title: "Temp", reading: "12", unit: "°C")
}
