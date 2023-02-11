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
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                
                Grid{
                    HStack(alignment: .center, spacing: 10 ) {

                        NavigationLink("Lista jakści turbo", destination: airCityListButton(inputList: airArray) ).buttonStyle(.borderedProminent)
                        Button("Lista pogody") {
                        }.buttonStyle(.borderedProminent)
                        
                    }
                    
                    WeatherFactory()
                    AirFactory()
                    locationView()
                    
                }.background(Image("croatia").resizable().scaledToFill().ignoresSafeArea(.all) )
                
                
            }
        }
    }
}
