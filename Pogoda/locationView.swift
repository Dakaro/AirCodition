//
// Created by Dawid on 11.02.2023.
//

import Foundation
import SwiftUI
import CoreLocationUI
import CoreLocation
import Combine

struct locationView: View {
    @ObservedObject var lm = LocationManager()
    var placemark: String {
        return("\(lm.placemark?.description ?? "lokalizacja niedostępna") " )
    }

    var body: some View{
        Text( "\(self.placemark)" )
    }
}

struct locationView_Previews: PreviewProvider {
    static var previews: some View {
        locationView()
    }
}

class LocationManager: NSObject, ObservableObject {
    private let geocoder = CLGeocoder()

    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()

    @Published var status: CLAuthorizationStatus? {
        willSet { objectWillChange.send() }
    }

    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }

    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    @Published var placemark: CLPlacemark? {
        willSet { objectWillChange.send() }
    }

    private func geocode() {
        guard let location = self.location else { return }
        geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
            if error == nil {
                self.placemark = places?[0]
            } else {
                self.placemark = nil
            }
        })

    }
}

extension LocationManager: CLLocationManagerDelegate {
    
}
