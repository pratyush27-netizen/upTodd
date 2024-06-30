//
//  ContentView.swift
//  Atmos
//
//  Created by Pratyush Choubey on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LoacationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
