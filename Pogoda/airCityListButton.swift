//
//  airCityListButton.swift
//  Pogoda
//
//  Created by Student1 on 30/01/2023.
//

import SwiftUI

struct airCityListButton: View {
    
     @State private  var boolList: [jsonAir]
    @Environment(\.dismiss) private var dismiss

    var airList: [jsonAir]
    var temporatyList: [Int]

    init(inputList: [jsonAir]){
        
        airList = inputList
        _boolList = State(initialValue: inputList)
        temporatyList = []
    }
    

    
    var body: some View {
        
        Form(){
            ForEach($boolList, id: \.id){
                tmp in let myVar = airList.first(where: { $0.id == tmp.id } )
                Toggle(myVar?.stationName ?? "city" , isOn: tmp.onList)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button("powrót", action: {
            writeToLocalFile(name: "zbiorMiast", airArray: boolList)
            dismiss()
        } ) )
    }
}
    
    struct airCityListButton_Previews: PreviewProvider {
        static var previews: some View {
            airCityListButton(inputList: getAirArray())
        }
    }

    



