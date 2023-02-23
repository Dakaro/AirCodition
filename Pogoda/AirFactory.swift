//
//  AirFactory.swift
//  Pogoda
//
//  Created by Student1 on 17/01/2023.
//

import SwiftUI

struct AirFactory: View {
    
    @State var data = [AirCondition]()
    
    func getAll() {
        let group = DispatchGroup()
        var airConditions = [AirCondition]()
        let array = getAirArray()
        
        for tmp in array {
            if tmp.onList == true {
                group.enter()
                loadAirData(inputId: tmp.id) { myItem in
                    airConditions.append(AirCondition(inputCity: tmp.stationName, inputHour: myItem.hour , inputCondition: myItem.id))
                    group.leave()
                }
            }
        }
        group.notify(queue: .main) {
            DispatchQueue.main.async {
                self.data = []
                for cond in airConditions {
                    self.data.append(cond)
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: 10.0) {
                ForEach(data, id: \.city) { item in
                    OneCityAirView(inputAir: item)
                }
            }.padding().onAppear {
                getAll()
            }
        }
    }
}

struct AirFactory_Previews: PreviewProvider {
    static var previews: some View {
        AirFactory()
    }
}
