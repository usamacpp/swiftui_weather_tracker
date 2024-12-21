//
//  HomeView.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/15/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeVm = HomeViewModel(networkManager: NetworkManager.shared)
    @ObservedObject private var searchVm = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBarView(vm: searchVm)
                .frame(alignment: .top)
                .padding(.vertical)
            
            switch homeVm.currState {
            case .noCurrentCity:
                Spacer()
                NoCitySelected()
                Spacer()
            case .hasCurrentCity(let weatherData, let error):
                if let weatherData {
                    WeatherDetailsTile(weatherData: weatherData)
                    Spacer()
                }
            case .searching(let weatherData, let error):
                if let weatherData {
                    SearchResultTile(cityName: weatherData.location.name, temp: "\(weatherData.current.temp_f)", iconUrl: "https:" + weatherData.current.condition.icon, vm: homeVm)
                }
                Spacer()
            }
        }
        .font(.poppins(.regular, size: 15))
        .padding()
        .task {
            await homeVm.getCurrentCity()
        }
        .onChange(of: searchVm.searchText) { oldValue, newValue in
            if !newValue.isEmpty {
                Task {
                    await homeVm.searchCity(name: newValue)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
