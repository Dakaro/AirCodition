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
            Text(cityWeather.city).font(.title)
            Text( cityWeather.hour ).font(.subheadline)
            Image(cityWeather.image).resizable().frame(width: 140, height: 140, alignment: .bottom).foregroundColor(.none)
            Text( String(cityWeather.temperature) + " ℃" ).font(.title)
            
            
            
        }).padding().background(Color(.white.withAlphaComponent(0.3)) ).cornerRadius(15).shadow(radius: 5)
            
    }
    
    init(inputWeather: Weather){
        cityWeather = inputWeather
    }
    
}

struct OneCityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        OneCityWeatherView( inputWeather: Weather(inputCity: "Kraków", inputHour: "12:00", inputTemperature: 15.0, inputRain: 5.0) )
    }
}
