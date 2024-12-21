//
//  NoCitySelected.swift
//  WeatherTracker
//
//  Created by ossama mikhail on 12/17/24.
//

import SwiftUI

struct NoCitySelected: View {
    var body: some View {
        Group {
            Text("No City Selected").font(.poppins(.semiBold, size: 30))
            Text("Please Search For A City")
        }.font(.poppins(.regular, size: 15))
    }
}

#Preview {
    NoCitySelected()
}
