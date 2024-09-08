import Foundation
import CoreLocation

class WeatherViewModel: NSObject, CLLocationManagerDelegate {
    private let weatherService = WeatherService()
    private var locationManager = CLLocationManager()
    var weather: Weather?
    
    var onWeatherUpdated: ((Weather?) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        fetchWeatherForCoordinates(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        locationManager.stopUpdatingLocation()
    }
    
    func fetchWeatherForCoordinates(lat: Double, lon: Double) {
        weatherService.fetchWeather(lat: lat, lon: lon) { [weak self] weather in
            self?.weather = weather
            self?.onWeatherUpdated?(weather)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ошибка определения местоположения: \(error.localizedDescription)")
    }
}
