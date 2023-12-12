//
//  MainViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setupUI(cityName: String, temperature: String, temperatureNote: String)
}

final class MainViewController: BaseViewController {
    
    //MARK: - Properties
    
    var presenter: MainPresenterProtocol!
    private let configurator: MainConfiguratorProtocol = MainCofigurator()
    
    private lazy var mainTopView = MainTopView()
    private lazy var collectionView: IHCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width,
                                            height: UIScreen.main.bounds.height * 0.15)
        let view = IHCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        setupViews()
        setupConstraints()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupEventBinding()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .gray
        hideNavigationBar()
    }
    //MARK: - Setup Views
    
    override func setupViews() {
        view.setupView(mainTopView)
        view.setupView(collectionView)
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTopView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTopView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * CGFloat(0.3)),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainTopView.bottomAnchor, constant: 3)
        ])
    }
}

extension MainViewController: MainViewProtocol {
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupUI(cityName: String, temperature: String, temperatureNote: String) {
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
