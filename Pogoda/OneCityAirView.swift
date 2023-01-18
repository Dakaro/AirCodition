//
//  OneCityAirView.swift
//  Pogoda
//
//  Created by Student1 on 17/01/2023.
//

import SwiftUI
import UIKit




struct OneCityAirView: View {

    var cityAir: AirCondition
    
    
    var body: some View {
        
        Grid(content: {
            Text(cityAir.city).font(.title)
            Text( cityAir.hour ).font(.subheadline)
            Text( cityAir.text ).font(.title).foregroundColor(cityAir.color)
            
        }).padding().background(Color(.white.withAlphaComponent(0.8)) ).cornerRadius(15).shadow(radius: 5)
            
    }
    
    init(inputAir: AirCondition){
        cityAir = inputAir
    }
    
}

struct OneCityAirView_Previews: PreviewProvider {
    static var previews: some View {
        OneCityAirView( inputAir: AirCondition(inputCity: "Kraków", inputHour: "11:00", inputCondition: -1) )
    }
}
