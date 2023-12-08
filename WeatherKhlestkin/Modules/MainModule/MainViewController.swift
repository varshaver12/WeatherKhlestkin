//
//  MainViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
}

class MainViewController: BaseViewController {
    
    var presenter: MainPresenterProtocol!
    private let configurator: MainConfiguratorProtocol = MainCofigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    //MARK: - Setup Views
    
    override func setupViews() {
        
    }
    
    override func setupConstraints() {
        
    }
}

extension MainViewController: MainViewProtocol {
    
}
