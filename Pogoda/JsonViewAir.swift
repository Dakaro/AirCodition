//
//  JsonViewAir.swift
//  Pogoda
//
//  Created by Student1 on 27/01/2023.
//

import Foundation
import SwiftUI



func getAirArray() -> [jsonAir]{
    
    
    let airData = readLocalFile(forName: "zbiorMiast")
    
    return  parseToAir(jsonData: airData)
    
}
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
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
    
