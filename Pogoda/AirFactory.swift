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

                ForEach(getAirArray(), id: \.id){
                    tmp in
                    if tmp.onList == true {
                        var myItem = loadAirData(tmp.id)
                        AirCondition(inputCity: tmp.stationName, inputHour: myItem.hour , inputCondition: myItem.id)
                    }
                }

            }.padding()
        }
    }
}

struct AirFactory_Previews: PreviewProvider {
    static var previews: some View {
        AirFactory()
    }
}
