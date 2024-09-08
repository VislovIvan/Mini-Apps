import UIKit

class WeatherDetailViewController: UIViewController {
    private var weatherView: WeatherView?
    private var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let viewModel = WeatherViewModel()
        weatherViewModel = viewModel
        
        let newWeatherView = WeatherView(viewModel: viewModel)
        weatherView = newWeatherView
        
        view.addSubview(newWeatherView)
        newWeatherView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newWeatherView.topAnchor.constraint(equalTo: view.topAnchor),
            newWeatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
