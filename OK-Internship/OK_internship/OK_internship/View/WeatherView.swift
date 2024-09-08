import UIKit

final class WeatherView: UIView {
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private var viewModel: WeatherViewModel?
    
    init(viewModel: WeatherViewModel) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        setupView()
        bindViewModel()
        showLoadingIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(temperatureLabel)
        addSubview(activityIndicator)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel?.onWeatherUpdated = { [weak self] weather in
            guard let weather = weather else { return }
            
            DispatchQueue.main.async {
                self?.hideLoadingIndicator()
                self?.temperatureLabel.text = "\(weather.main.temp)°C"
                self?.descriptionLabel.text = weather.weather.first?.description ?? "Нет описания"
            }
        }
    }
    
    private func showLoadingIndicator() {
        activityIndicator.startAnimating()
        temperatureLabel.isHidden = true
        descriptionLabel.isHidden = true
    }
    
    private func hideLoadingIndicator() {
        activityIndicator.stopAnimating()
        temperatureLabel.isHidden = false
        descriptionLabel.isHidden = false
    }
}
