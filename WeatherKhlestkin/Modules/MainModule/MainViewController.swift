//
//  MainViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setupUIBinding(cityName: String, temperature: String, temperatureNote: String)
}

final class MainViewController: BaseViewController {
    
    //MARK: - Properties
    
    var presenter: MainPresenterProtocol!
    private let configurator: MainConfiguratorProtocol = MainCofigurator()
    
    private lazy var mainTopView = MainTopView()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupEventBinding()
    }
    
    //MARK: - Setup Views
    
    override func setupViews() {
        view.backgroundColor = .gray
        view.setupView(mainTopView)
        hideNavigationBar()
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTopView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTopView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * CGFloat(0.38))
        ])
    }
}

extension MainViewController: MainViewProtocol {
    
    func setupUIBinding(cityName: String, temperature: String, temperatureNote: String) {
        DispatchQueue.main.async {
            self.mainTopView.configure(cityName: cityName, temperature: temperature, temperatureNote: temperatureNote)
        }
    }
    
    func setupEventBinding() {

        mainTopView.findButtonDidTap = { [weak self] in
            self?.presenter?.findButtonDidTap()
        }
        
        mainTopView.favoritesListButtonDidTap = { [weak self] in
            self?.presenter?.favoritesListButtonDidTap()
        }
        
    }
}
