//
//  WeatherFactory.swift
//  Pogoda
//
//  Created by Student1 on 17/01/2023.
//

import SwiftUI

struct WeatherFactory: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(alignment: .center, spacing: 10.0){
            OneCityWeatherView(inputWeather: Weather(inputCity: "Kraków1", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.0) )
             OneCityWeatherView(inputWeather: Weather(inputCity: "Kraków2", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.1) )
             OneCityWeatherView(inputWeather: Weather(inputCity: "Kraków3", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.0) )
             OneCityWeatherView(inputWeather: Weather(inputCity: "Kraków4", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.0) )
             OneCityWeatherView(inputWeather: Weather(inputCity: "Kraków5", inputHour: "12:00", inputTemperature: 15.0, inputRain: 0.0) )
            }.padding()
        }
    }
    
    
    
    
}

struct WeatherFactory_Previews: PreviewProvider {
    static var previews: some View {
        WeatherFactory()
    }
}
