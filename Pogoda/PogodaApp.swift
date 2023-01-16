//
//  PogodaApp.swift
//  Pogoda
//
//  Created by Student1 on 16/01/2023.
//

import SwiftUI

@main
struct PogodaApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            OneCityWeatherView( inputWeather: Weather(inputCity: "Krakow", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.0) )
        }
    }
}
