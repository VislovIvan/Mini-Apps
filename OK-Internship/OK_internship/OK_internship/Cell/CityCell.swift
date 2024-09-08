import Foundation
import UIKit
import CityCorelocationSPM

final class CityCell: UITableViewCell {
    private var cityView: CityView?
    
    func setup(with viewModel: CityViewModel) {
        cityView?.removeFromSuperview()
        
        let newCityView = CityView(viewModel: viewModel)
        contentView.addSubview(newCityView)
        newCityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newCityView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newCityView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            newCityView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newCityView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        cityView = newCityView
    }
}
