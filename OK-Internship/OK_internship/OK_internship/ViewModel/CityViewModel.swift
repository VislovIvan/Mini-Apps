//import Foundation
//
//class CityViewModel {
//    private let locationManager = CityLocationManager()
//    var cityName: String = "Loading..."
//    
//    var onCityNameUpdated: ((String) -> Void)?
//    
//    init() {
//        locationManager.startUpdatingLocation { [weak self] cityName in
//            self?.cityName = cityName
//            self?.onCityNameUpdated?(cityName)
//        }
//    }
//}
