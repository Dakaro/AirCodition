//
// Created by Dawid on 23.02.2023.
//

import Foundation
import SwiftUI
import CoreData

func deleteAllWeather() {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "WeatherCity")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
        let context = PersistenceController.shared.container.viewContext
        try PersistenceController.shared.container.persistentStoreCoordinator.execute(deleteRequest, with: context)
    } catch {
        print(error)
    }
}
// always return current weather array
func getWeatherArray() -> [jsonWeather] {
    let request: NSFetchRequest<WeatherCity> = WeatherCity.fetchRequest()
    let context = PersistenceController.shared.container.viewContext
    do {
        
        let dataArray = try context.fetch(request)
        if dataArray.isEmpty {
            return parseToWeather(jsonData: readLocalFileWeather(forName: "zbiorMiastWeather"))
        }
        return dataArray.compactMap { weatherCity in
            jsonWeather(id: Int(weatherCity.cityId), onList: weatherCity.onList, stationName: weatherCity.cityName ?? "")
        }
    } catch {
        print("error reading coredata")
    }
    return []
}

func writeToLocalFile(name: String, weatherArray: [jsonWeather]) {
    deleteAllWeather()
    weatherArray.forEach { jsonWeather in
        let context = PersistenceController.shared.container.viewContext
        let city = WeatherCity(context: context)
        city.cityName = jsonWeather.stationName
        city.cityId = Int16(jsonWeather.id)
        city.onList = jsonWeather.onList
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("error writing coredata")
            }
        }
    }
}

func readLocalFileWeather(forName name: String) -> Data? {
    do {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let myURL = dir!.appendingPathComponent(name)
        let bundlePath = myURL.absoluteString
        if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            print("my data: " , jsonData.debugDescription)
            print(bundlePath)
            return jsonData
        }
    } catch {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                print("my data: " , jsonData.debugDescription)
                print(bundlePath)
                return jsonData
            }
        }catch {
            print("read file error")
            print(error)
        }
    }

    return nil
}


func parseToWeather(jsonData: Data?) -> [jsonWeather] {

    var result = [jsonWeather(id: 0, onList: false, stationName: "brak")]
    do {
        if let jsonData = jsonData {
            let decodedData = try JSONDecoder().decode(WeatherList.self, from: jsonData)
            
            result = decodedData.myListWeather
        }
    } catch {
        print("decode error")
    }

    return result
}

