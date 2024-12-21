//
//  SearchBarView.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/15/24.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var vm: SearchViewModel
    
    var body: some View {
        HStack {
            TextField("Search Location", text: $vm.searchText, prompt: Text("Search Location")
                .foregroundColor(.searchbarForeground))
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.searchbarForeground)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.searchbarBackground)
        )
//        .padding(.horizontal)
        .onReceive(vm.$searchText.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)) { text in
            vm.executionTimes += 1
            print(vm.searchText)
        }
    }
}

#Preview("no search text") {
    SearchBarView(vm: SearchViewModel())
}

#Preview("with search text") {
    SearchBarView(vm: SearchViewModel())
}
