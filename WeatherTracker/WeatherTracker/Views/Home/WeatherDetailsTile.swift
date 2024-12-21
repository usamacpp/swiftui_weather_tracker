//
//  WeatherDetailsTile.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/15/24.
//

import SwiftUI

struct WeatherDetailsTile: View {
    let weatherData: WeatherData
    
    var body: some View {
        VStack {
            Group {
                if let url = weatherData.currentConditionIconUrl() {
                    AsyncImage(url: url) { image in
                        image.image?.resizable()
                    }
                    .frame(width: 120, height: 120)
                } else {
                    Image("cloudy")
                }
            }
            .padding(.vertical)
            
            HStack {
                Text(weatherData.location.name).font(.largeTitle).fontWeight(.semibold)
                Image("location").resizable().frame(width: 20, height: 20)
            }
            
            HStack {
                Text("\(UInt(weatherData.current.temp_f))").font(.largeTitle).fontWeight(.bold)
                Text("°").font(.largeTitle).fontWeight(.thin)
            }
            .padding(.vertical)
            
            HStack {
                ReadingView(title: "Humidity", reading: "\(UInt(weatherData.current.humidity))", unit: "%")
                
                ReadingView(title: "UV", reading: "\(UInt(weatherData.current.uv))", unit: nil)
                
                ReadingView(title: "Feels Like", reading: "\(UInt(weatherData.current.feelslike_f))", unit: "°")
            }
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.tilesBackground))
            
            Spacer()
        }
    }
}

#Preview {
    let testData = WeatherData(location: WeatherData.Location(name: "chicago"), current: WeatherData.Current(condition: WeatherData.Current.Condition(text: "Misty", icon: ""), temp_f: 31, feelslike_f: 0, humidity: 0, uv: 0))
    WeatherDetailsTile(weatherData: testData)
}
