//
//  MainViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit


protocol MainViewProtocol: AnyObject {
    func reloadCollectionView()
    func setupUI(with currentWeather: [CurrentWeather], cityName: String)
}

final class MainViewController: BaseViewController {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let headerViewHeightRatio = CGFloat(0.38)
        static let hourlyCellHeightRatio = CGFloat(0.12)
    }
    
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
        setupEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAppearance()
        presenter?.viewWillAppear()
    }
    
    //MARK: - Setup Views and config
    private func configureAppearance() {
        view.backgroundColor = .white
        hideNavigationBar()
    }
    
    override func setupViews() {
        view.setupView(mainTopView)
        view.setupView(collectionView)
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTopView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTopView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * UI.headerViewHeightRatio),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainTopView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: MainViewProtocol {
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupUI(with currentWeather: [CurrentWeather], cityName: String) {
        DispatchQueue.main.async {
            self.mainTopView.configure(cityName: cityName, currentWeather: currentWeather)
            
            self.collectionView.hourlyCollectionDidLoad = { collectionView in
                
                collectionView.hourlyCollectionView.hourlyTempCollectionCellDidLoad = { cell, indexPath in
                    cell.configureCell(currentWeather: currentWeather, item: indexPath.item)
                }
                collectionView.hourlyCollectionView.reloadData()
                
            }
            
        }
    }
    
    func setupEvent() {
        mainTopView.findButtonDidTap = {
            self.presenter?.findButtonDidTap()
        }
    }
}
