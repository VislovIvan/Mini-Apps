import Foundation

final class WeatherService {
    private let apiKey = "31f576640b1ac5a863e6ba3658d08042"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Weather?) -> Void) {
        let urlString = "\(baseURL)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка при запросе погоды: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Данные не получены")
                completion(nil)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(weather)
            } catch {
                print("Ошибка декодирования данных погоды: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
