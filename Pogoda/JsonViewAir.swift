//
//  JsonViewAir.swift
//  Pogoda
//
//  Created by Student1 on 27/01/2023.
//

import Foundation
import SwiftUI


// always return current air array
func getAirArray() -> [jsonAir]{

    let airData = readLocalFile(forName: "zbiorMiast")
    
    return  parseToAir(jsonData: airData)

}

func writeToLocalFile(name: String, airArray: [jsonAir]){
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    let myURL = dir!.appendingPathComponent(name)
    let encoder = JSONEncoder()
    
    do {
        
        var myJSONList: AirList = AirList(myList: airArray)
        
        let jsonData = try JSONEncoder().encode(myJSONList)
        try jsonData.write(to: myURL)
        print("zapisuje do JSONA")
        
        /// zpapisuje dobrze tylko nie wiadomo gdzie
        
        let decodedData = try JSONDecoder().decode(AirList.self, from: jsonData)
        
        decodedData.myList.forEach{
            tmp in print(tmp.stationName + " \(tmp.onList)" )
        }
        
    } catch {
        print("write file error")
     print(error)
    }
    
}
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                print("my data: " , jsonData.debugDescription)
                return jsonData
            }
        } catch {
            print("read file error")
         print(error)
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
    
