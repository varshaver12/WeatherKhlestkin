//
//  MainRouter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainRouterProtocol: AnyObject {
    func pushToFindViewController(view: MainViewProtocol)
}

final class MainRouter {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
}

extension MainRouter: MainRouterProtocol {
    func pushToFindViewController(view: MainViewProtocol) {
        let findViewController = FindCofigurator.createFindModule()

        viewController.navigationController?.pushViewController(findViewController, animated: true)
    }
    
}
