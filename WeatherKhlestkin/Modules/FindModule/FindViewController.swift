//
//  FindViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit

protocol FindViewProtocol: AnyObject {
    func reloadTableView()
}

final class FindViewController: BaseViewController {
    
    //MARK: - Properties
    
    var presenter: FindPresenterProtocol!
    private let configurator: FindConfiguratorProtocol = FindCofigurator()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        setupViews()
        setupConstraints()
        configurator.configure(with: self)


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    //MARK: - Setup Views and config
    private func configureAppearance() {
        view.backgroundColor = .white
        //hideNavigationBar()
    }
    
    override func setupViews() {

    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([

        ])
    }
}

extension MainViewController: FindViewProtocol {
    func reloadTableView() {
        
    }
}
