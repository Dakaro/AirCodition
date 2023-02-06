//
//  jsonViews.swift
//  Pogoda
//
//  Created by Student1 on 27/01/2023.
//

import Foundation

class jsonAir: Codable, Identifiable{
    
    var id: Int
    var stationName: String
    var onList: Bool
    
    init(id: Int, onList: Bool, stationName: String) {
        self.id = id
        self.onList = onList
        self.stationName = stationName
    }
}


class AirList: Codable{
    
   var myList: [jsonAir]
}
