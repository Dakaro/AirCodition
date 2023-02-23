//
//  JsonViewAir.swift
//  Pogoda
//
//  Created by Student1 on 27/01/2023.
//

import Foundation
import SwiftUI
import CoreData

func deleteAllAIR() {
    var fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "AirCity")
    var deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    do {
        let context = PersistenceController.shared.container.viewContext
        try PersistenceController.shared.container.persistentStoreCoordinator.execute(deleteRequest, with: context)
    } catch {
        print(error)
    }
}
// always return current air array
func getAirArray() -> [jsonAir] {
    let request: NSFetchRequest<AirCity> = AirCity.fetchRequest()
    let context = PersistenceController.shared.container.viewContext
    do {
        let dataArray = try context.fetch(request)
        if dataArray.isEmpty {
            return parseToAir(jsonData: readLocalFileAIR(forName: "zbiorMiast"))
        }
        return dataArray.compactMap { airCity in
            jsonAir(id: Int(airCity.cityId), onList: airCity.onList, stationName: airCity.cityName ?? "")
        }
    } catch {
        print("error reading coredata")
    }
    return []
}

func writeToLocalFile(name: String, airArray: [jsonAir]) {
    deleteAllAIR()
    airArray.forEach { jsonAir in
        let context = PersistenceController.shared.container.viewContext
        let city = AirCity(context: context)
        city.cityName = jsonAir.stationName
        city.cityId = Int16(jsonAir.id)
        city.onList = jsonAir.onList
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("error writing coredata")
            }
        }
    }
}

func readLocalFileAIR(forName name: String) -> Data? {
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


func parseToAir(jsonData: Data?) -> [jsonAir] {
    
    var result = [jsonAir(id: 0, onList: false, stationName: "brak")]
    do {
        if( jsonData != nil ){
            let decodedData = try JSONDecoder().decode(AirList.self, from: jsonData!)
            result = decodedData.myList
        }
    } catch {
        print("decode error")
        
    }
    
    return result
}

