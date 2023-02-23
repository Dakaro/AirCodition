//
// Created by Dawid on 11.02.2023.
//

import Foundation
import SwiftUI
import CoreLocationUI
import CoreLocation
import Combine
//50.031 19.9065
struct locationView: View {
    @ObservedObject var lm = LocationManager()
    var placemark: String {
        if let street = lm.placemark?.name, let city = lm.placemark?.locality {
            return "\(city)\n\(street)"
        }
        return "lokalizacja niedostępna"
    }

    var body: some View {
        Button("\(self.placemark)"){}.padding().buttonStyle(.borderedProminent).tint(.black).font(.footnote)
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
        locationManager.requestLocation()
        
        
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
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        self.location = locations.first
        geocode()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
