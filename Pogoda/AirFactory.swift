//
//  AirFactory.swift
//  Pogoda
//
//  Created by Student1 on 17/01/2023.
//

import SwiftUI

struct AirFactory: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(alignment: .center, spacing: 10.0){
                OneCityAirView( inputAir: AirCondition(inputCity: "Kraków1", inputHour: "11:00", inputCondition: 0) )
                OneCityAirView( inputAir: AirCondition(inputCity: "Kraków2", inputHour: "11:00", inputCondition: -1) )
                OneCityAirView( inputAir: AirCondition(inputCity: "Kraków3", inputHour: "11:00", inputCondition: 1) )
                OneCityAirView( inputAir: AirCondition(inputCity: "Kraków4", inputHour: "11:00", inputCondition: 2) )
                OneCityAirView( inputAir: AirCondition(inputCity: "Kraków5", inputHour: "11:00", inputCondition: 3) )
            }.padding()
        }
    }
}

struct AirFactory_Previews: PreviewProvider {
    static var previews: some View {
        AirFactory()
    }
}
