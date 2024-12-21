//
//  SearchResultTile.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/17/24.
//

import SwiftUI

struct SearchResultTile: View {
    let cityName: String
    let temp: String
    let iconUrl: String
    
    let vm: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityName).font(.title2).bold()
                HStack {
                    Text("\(temp)").font(.largeTitle).bold()
                    Text("°").font(.largeTitle).fontWeight(.thin)
                }
            }
            .padding()
            Spacer()
            if let url = URL(string: iconUrl) {
                AsyncImage(url: url).padding()
            } else {
                Image("cloudy").padding()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.tilesBackground)
        )
        .frame(minHeight: 117)
        .onTapGesture {
            Task {
                await vm.setCurrentCity(name: cityName)
            }
        }
    }
}

#Preview {
    SearchResultTile(cityName: "Chicago", temp: "18", iconUrl: "", vm: HomeViewModel(networkManager: NetworkManager.shared))
}
