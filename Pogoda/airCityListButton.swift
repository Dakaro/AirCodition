//
//  airCityListButton.swift
//  Pogoda
//
//  Created by Student1 on 30/01/2023.
//

import SwiftUI

struct airCityListButton: View {
    
    var airList: [jsonAir]

    @State var boolList: [jsonAir]
    
    init(inputList: [jsonAir]){
        airList = inputList
        boolList = inputList
    }
    
    var body: some View {
        
        Form(){
            ForEach($boolList, id: \.id){
                tmp in let myVar = airList.first(where: { $0.id == tmp.id } )
                Toggle(myVar?.stationName ?? "city" , isOn: tmp.onList)
            }
        }
        
        .navigationBarItems(leading: Button("przycisk", action: { print("wracam") } ) )
    }
}
    
    struct airCityListButton_Previews: PreviewProvider {
        static var previews: some View {
            airCityListButton(inputList: getAirArray())
        }
    }

    



