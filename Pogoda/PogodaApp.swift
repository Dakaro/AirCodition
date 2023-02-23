//
//  PogodaApp.swift
//  Pogoda
//
//  Created by Student1 on 16/01/

import SwiftUI


@main
struct PogodaApp: App {
    let persistenceController = PersistenceController.shared
    
    var airArray = getAirArray()
    var weatherArray = getWeatherArray()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                
                Grid{
                    HStack(alignment: .center, spacing: 10 ) {

                        NavigationLink("Lista jakości", destination: airCityListButton(inputList: airArray) ).buttonStyle(.borderedProminent)
                        NavigationLink("Lista pogody", destination: weatherCityListButton(inputList: weatherArray) ).buttonStyle(.borderedProminent)
                        
                    }

                    WeatherFactory()
                    AirFactory()
                    locationView()
                    
                }.background(Image("croatia").resizable().scaledToFill().ignoresSafeArea(.all) )
                
                
            }
        }
    }
}
