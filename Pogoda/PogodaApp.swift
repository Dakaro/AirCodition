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
                HStack{
                Button("-") {
                    print("odejmuje")
                    }
                    Button("+") {
                        print("dodaje")
                    }.buttonStyle(.bordered)
                  
                }
                WeatherFactory()
                AirFactory().padding()
            }.background(Image("background").resizable().scaledToFill().ignoresSafeArea(.all) ).lineSpacing(10)
            
        }
    }
}
