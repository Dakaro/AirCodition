//
// Created by Dawid on 23.02.2023.
//

import Foundation


struct WeatherResult: Codable{
    var id_stacji: Int
    var godzina_pomiaru: String
    var temperatura: Float
    var suma_opadu: Float

}


func loadWeatherData(inputId: Int, completion: @escaping (_: (hour: String, temperatura: Float, suma_opadu: Float)) -> ()) {
    guard let url = URL(string: "https://danepubliczne.imgw.pl/api/data/synop/id/\(inputId)"  ) else {
        print(" cannot load URL source ")
        return
    }

    URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(WeatherResult.self, from: data) {
                completion((decodedResponse.godzina_pomiaru, decodedResponse.temperatura, decodedResponse.suma_opadu))
            } else {
                completion(("brak", 0, 0))
                print("error while decoding")
            }
        } else {
            print("data cannot be read")
        }
    }.resume()
}
