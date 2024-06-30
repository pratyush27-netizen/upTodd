//
//  WelcomeView.swift
//  Atmos
//
//  Created by Pratyush Choubey on 30/06/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LoacationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("ATMOS 🌤️")
                    .bold().font(.title)
                Text("Please share your current location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
