//
// Created by Dawid on 11.02.2023.
//

import Foundation


struct AirResult: Codable{
    var id: Int
    var pm10CalcDate: String
//        get {
//            String(self.psplit(separator: " ")[1])
//        }
//    }
    var pm10IndexLevel: indexLevel

}

struct indexLevel: Codable{
    var id: Int
}



func loadAirData(inputId: Int, completion: @escaping (_: (hour: String, id: Int)) -> ()) {
    guard let url = URL(string: "https://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex/\(inputId)"  ) else {
        print(" cannot load URL source ")
        return
    }
    
    URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(AirResult.self, from: data) {
                completion((decodedResponse.pm10CalcDate, decodedResponse.pm10IndexLevel.id))
            } else {
                completion(("brak", -1))
                print("error while decoding")
            }
        } else {
            print("data cannot be read")
        }
    }.resume()
}
