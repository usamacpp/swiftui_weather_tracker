//
//  SearchViewModel.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/18/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var executionTimes = 0
}
