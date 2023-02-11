//
// Created by Dawid on 11.02.2023.
//

import Foundation

struct AirResult: Codable{
    var id: Int
    var pm10CalcDate: String{ _pm10CalcDate = newValue.split(" ")[1]  }
    var pm10IndexLevel: indexLevel

}

struct indexLevel: Codable{
    var id: Int
}

func loadAirData(inputId: Int ) async -> (hour: String, id: Int) {
    guard let url = URL(string: "https://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex/\(inputId)"  ) else {
        print(" cannot load URL source ")
        return
    }

    do {
        let (data, _) = try await URLSession.share.data(from: url)

        if let decodedResponse = try ? JSONDecoder().decode(AirResult.self, from: data) {
        return (decodedResponse.pm10CaclDate, decodedResponse.pm10IndexLevel.id)
        }
    } catch {
        print(" invalid data ")
        return ("data error", 0 )
    }


}
