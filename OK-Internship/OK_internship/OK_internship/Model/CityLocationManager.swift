//import Foundation
//import CoreLocation
//
//final class CityLocationManager: NSObject {
//    private let locationManager = CLLocationManager()
//    private var onCityNameUpdated: ((String) -> Void)?
//
//    override init() {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.requestWhenInUseAuthorization()
//    }
//
//    func startUpdatingLocation(onCityNameUpdated: @escaping (String) -> Void) {
//        self.onCityNameUpdated = onCityNameUpdated
//        locationManager.startUpdatingLocation()
//    }
//}
//
//extension CityLocationManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.first else { return }
//        let geocoder = CLGeocoder()
//        
//        geocoder.reverseGeocodeLocation(location) { placemarks, error in
//            guard let placemark = placemarks?.first, error == nil else { return }
//            let cityName = placemark.locality ?? "Unknown city"
//            self.onCityNameUpdated?(cityName)
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Failed to find location: \(error.localizedDescription)")
//    }
//}
