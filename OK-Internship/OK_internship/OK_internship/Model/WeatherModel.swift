import Foundation

struct Weather: Decodable {
    let main: Main
    let weather: [WeatherInfo]
    let name: String
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct WeatherInfo: Decodable {
        let description: String
    }
}
