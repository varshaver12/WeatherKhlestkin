//
//  FindConfigurator.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit

protocol FindConfiguratorProtocol: AnyObject {
    
}

final class FindCofigurator: FindConfiguratorProtocol {

    static func createFindModule() -> UIViewController {
        let viewController = FindViewController()
        
        let presenter: FindPresenterProtocol & FindInteractorOutputProtocol = FindPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = FindRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = FindInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
