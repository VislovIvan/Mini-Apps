//import UIKit
//
//final class CityView: UIView {
//    private let cityLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        return label
//    }()
//    
//    private var viewModel: CityViewModel?
//
//    init(viewModel: CityViewModel) {
//        super.init(frame: .zero)
//        self.viewModel = viewModel
//        setupView()
//        bindViewModel()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupView() {
//        addSubview(cityLabel)
//        cityLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
//    
//    private func bindViewModel() {
//        viewModel?.onCityNameUpdated = { [weak self] cityName in
//            DispatchQueue.main.async {
//                self?.cityLabel.text = cityName
//            }
//        }
//    }
//}
