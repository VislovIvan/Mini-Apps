import Foundation
import UIKit

final class WeatherCell: UITableViewCell {
    private var weatherView: WeatherView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWeatherView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWeatherView() {
        weatherView = WeatherView(viewModel: WeatherViewModel())
        guard let weatherView = weatherView else { return }
        
        contentView.addSubview(weatherView)
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: contentView.topAnchor),
            weatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            weatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setup(with viewModel: WeatherViewModel, isBold: Bool) {
        weatherView?.removeFromSuperview()
        
        let newWeatherView = WeatherView(viewModel: viewModel)
        contentView.addSubview(newWeatherView)
        newWeatherView.translatesAutoresizingMaskIntoConstraints = false
        
        if isBold {
            newWeatherView.temperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        } else {
            newWeatherView.temperatureLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        }
        
        NSLayoutConstraint.activate([
            newWeatherView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newWeatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            newWeatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newWeatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        weatherView = newWeatherView
    }
}
