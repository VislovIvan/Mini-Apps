import UIKit
import CityCorelocationSPM

class CityDetailViewController: UIViewController {
    private var cityView: CityView?
    private var cityViewModel: CityViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let viewModel = CityViewModel()
        cityViewModel = viewModel
        
        let newCityView = CityView(viewModel: viewModel)
        cityView = newCityView
        
        view.addSubview(newCityView)
        
        newCityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newCityView.topAnchor.constraint(equalTo: view.topAnchor),
            newCityView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newCityView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newCityView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        viewModel.startUpdatingLocation()
    }
}
