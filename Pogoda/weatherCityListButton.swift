//
//  weatherCityListButton.swift
//  Pogoda
//
//  Created by Student1 on 23/02/2023.
//

import SwiftUI

struct weatherCityListButton: View {

    @State private var boolList: [jsonWeather]
    @Environment(\.dismiss) private var dismiss

    var weatherList: [jsonWeather]
    var temporatyList: [Int]

    init(inputList: [jsonWeather]){

        weatherList = inputList
        _boolList = State(initialValue: inputList)
        temporatyList = []
    }



    var body: some View {

        Form(){
            ForEach($boolList, id: \.id){
                tmp in let myVar = weatherList.first(where: { $0.id == tmp.id } )
                Toggle(myVar?.stationName ?? "city" , isOn: tmp.onList)
            }
        }
                .navigationBarBackButtonHidden()
                .navigationBarItems(leading: Button("Zapisz i wyjdź", action: {
                    writeToLocalFile(name: "zbiorMiastWeather", weatherArray: boolList)
                    dismiss()
                } ) )
    }
}

struct weatherCityListButton_Previews: PreviewProvider {
    static var previews: some View {
        weatherCityListButton(inputList: getWeatherArray())
    }
}





