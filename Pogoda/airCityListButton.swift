//
//  airCityListButton.swift
//  Pogoda
//
//  Created by Student1 on 30/01/2023.
//

import SwiftUI

struct airCityListButton: View {
    
   @State var airList: [jsonAir]
    
    init(inputList: [jsonAir]){
        airList = inputList
    }
    
    var body: some View {
        
        
        Grid{
            Form{
                ForEach($airList, id: \.stationName){
                    tmp in Toggle("ma tutaj byc miasto", isOn: tmp.onList)
                }
            }
        }
        
    }
    
    struct airCityListButton_Previews: PreviewProvider {
        static var previews: some View {
            airCityListButton(inputList: getAirArray())
        }
    }

    
}


