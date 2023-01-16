//
//  OneCity.swift
//  Pogoda
//
//  Created by Student1 on 16/01/2023.
//

import SwiftUI
import UIKit

struct OneCityWeatherView: View {

    var cityWeather: Weather
    
    
    var body: some View {
        
        Grid(content: {
            Text(cityWeather.city).font(.largeTitle)
            Image(cityWeather.image).resizable().frame(width: 140, height: 140, alignment: .bottom).foregroundColor(.none)
        }).padding(.bottom)
            
    }
    
    init(inputWeather: Weather){
        cityWeather = inputWeather
        print("balbla")
    }
    
}

struct OneCityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        OneCityWeatherView( inputWeather: Weather(inputCity: "Krakow", inputHour: "12:00", inputTemperature: 15.0, inputRain: 1.0) )
    }
}
