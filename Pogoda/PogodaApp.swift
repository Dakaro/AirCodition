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
            Grid{
            
                HStack(alignment: .center, spacing: 10 ) {
                    Button("Lista jakości") {
                    print("odejmuje")
                    }.buttonStyle(.borderedProminent)
                Button("Lista pogody") {
                        print("dodaje")
                }.buttonStyle(.borderedProminent)
                  
                }
                
                WeatherFactory()
                AirFactory()
                
            }.background(Image("background").resizable().scaledToFill().ignoresSafeArea(.all) )
           
            
        }
    }
}
