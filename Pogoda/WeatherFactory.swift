//
//  WeatherFactory.swift
//  Pogoda
//
//  Created by Student1 on 17/01/2023.
//

import SwiftUI

struct WeatherFactory: View {

    @State var data = [Weather]()

    func getAll(){
        let group = DispatchGroup()
        var weathers = [Weather]()
        var array = getWeatherArray()

        for tmp in array {
            if tmp.onList == true {
                group.enter()
                loadWeatherData(inputId: tmp.id) { myItem in
                    weathers.append(Weather(inputCity: tmp.cityName, inputHour: myItem.hour, inputTemperature: myItem.temperature, inputRain: myItem.rain ))
                    group.leave()
                }
            }
        }
        group.notify(queue: .main){
            DispatchQueue.main.async {
                self.data = []
                for cond in weathers {
                    self.data.append(cond)
                }
            }
        }

    }

    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(alignment: .center, spacing: 10.0){
                ForEach(data, id: \.city){ item in
                    OneCityWeatherView(inputWeather: item)
                }
            }.padding().onAppear{
                getAll()
            }
        }
    }
    
    
    
    
}

struct WeatherFactory_Previews: PreviewProvider {
    static var previews: some View {
        WeatherFactory()
    }
}
