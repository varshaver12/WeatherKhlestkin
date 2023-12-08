//
//  MainConfigurator.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

final class MainCofigurator: MainConfiguratorProtocol {
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
