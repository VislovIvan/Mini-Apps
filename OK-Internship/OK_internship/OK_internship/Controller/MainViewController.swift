import UIKit
import CityCorelocationSPM
import CrosswordSPM

enum LayoutMode {
    case small
    case medium
    case fullScreen
}

final class MainViewController: UIViewController {
    
    private let tableView = UITableView()
    private var layoutMode: LayoutMode = .small
    
    private let smallButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1/8 экрана", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mediumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1/2 экрана", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let fullScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Во весь экран", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        
        self.navigationItem.title = "Mini Apps"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(smallButton)
        view.addSubview(mediumButton)
        view.addSubview(fullScreenButton)
        
        smallButton.addTarget(self, action: #selector(switchToSmallMode), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(switchToMediumMode), for: .touchUpInside)
        fullScreenButton.addTarget(self, action: #selector(switchToFullScreenMode), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            smallButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            smallButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            mediumButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mediumButton.leadingAnchor.constraint(equalTo: smallButton.trailingAnchor, constant: 10),
            
            fullScreenButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fullScreenButton.leadingAnchor.constraint(equalTo: mediumButton.trailingAnchor, constant: 10),
            fullScreenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            smallButton.widthAnchor.constraint(equalTo: mediumButton.widthAnchor),
            mediumButton.widthAnchor.constraint(equalTo: fullScreenButton.widthAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CrosswordCell.self, forCellReuseIdentifier: "CrosswordCell")
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: smallButton.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func switchToSmallMode() {
        layoutMode = .small
        tableView.reloadData()
    }
    
    @objc private func switchToMediumMode() {
        layoutMode = .medium
        tableView.reloadData()
    }
    
    @objc private func switchToFullScreenMode() {
        layoutMode = .fullScreen
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if layoutMode == .small {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            if indexPath.row < 2 {
                cell.textLabel?.text = "Играть в кроссворд"
            } else if indexPath.row % 2 == 0 {
                cell.textLabel?.text = "Смотреть погоду"
            } else {
                cell.textLabel?.text = "Смотреть город"
            }
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .default
            return cell
        } else {
            if indexPath.row < 2 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CrosswordCell", for: indexPath) as? CrosswordCell else {
                    return UITableViewCell()
                }
                cell.setupGame()
                cell.selectionStyle = .none
                return cell
            } else if indexPath.row % 2 == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else {
                    return UITableViewCell()
                }
                let weatherViewModel = WeatherViewModel()
                let isBold = indexPath.row == 2
                cell.setup(with: weatherViewModel, isBold: isBold)
                cell.selectionStyle = .none
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else {
                    return UITableViewCell()
                }
                let cityViewModel = CityViewModel()
                cell.setup(with: cityViewModel)
                cell.selectionStyle = .none
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard layoutMode == .small else { return }
        
        if indexPath.row < 2 {
            let crosswordVC = CrosswordViewController()
            navigationController?.pushViewController(crosswordVC, animated: true)
        } else if indexPath.row % 2 == 0 {
            let weatherDetailVC = WeatherDetailViewController()
            navigationController?.pushViewController(weatherDetailVC, animated: true)
        } else {
            let cityDetailVC = CityDetailViewController()
            navigationController?.pushViewController(cityDetailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        switch layoutMode {
        case .small:
            return screenHeight / 8
        case .medium:
            return screenHeight / 2
        case .fullScreen:
            return screenHeight
        }
    }
}
