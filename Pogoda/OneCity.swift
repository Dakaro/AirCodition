//
//  OneCity.swift
//  Pogoda
//
//  Created by Student1 on 16/01/2023.
//

import Foundation
import SwiftUI

enum CONDITION: Int {
    case NULL = -1
    case VERY_GOOD
    case GOOD
    case MODERATE
    case BAD
    case VERY_BAD
    
}

protocol ForecastType {
    var city: String { get  }
    var hour: String { get  }
    
}

class Weather: ForecastType {
    var city: String
    var hour: String
    
    var temperature: Float
    var rain: Float
    var image: String
    
    init(inputCity: String, inputHour: String, inputTemperature: Float, inputRain: Float){
        city = inputCity
        hour = inputHour
        temperature = inputTemperature
        rain = inputRain
        
        image = rain > Float(0.0) ? "rain" : "sun"
    }
}

class AirCondition: ForecastType
    {
        var city: String
        var hour: String
        
        var condition: Int
        var text: String
        var color: Color
        
        init(inputCity: String, inputHour: String, inputCondition: Int){
            city = inputCity
            hour = inputHour
            condition = inputCondition
            
            switch condition {
            case CONDITION.NULL.rawValue:
                color = Color.gray
                text = "brak danych"
            case CONDITION.VERY_BAD.rawValue:
                color = Color.red
                text = "bardzo zły"
            case CONDITION.BAD.rawValue:
                color = Color.orange
                text = "zły"
            case CONDITION.MODERATE.rawValue:
                color = Color.brown
                text = "umiarkowany"
            case CONDITION.GOOD.rawValue:
                color = Color.mint
                text = "dobry"
            case CONDITION.VERY_GOOD.rawValue:
                color = Color.green
                text = "bardzo dobry"
                
            default:
                color = Color.gray
                text = "brak danych"
            }
            
            
        }
        
    }

