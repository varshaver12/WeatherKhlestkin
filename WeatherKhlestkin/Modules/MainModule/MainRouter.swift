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
        let vc = view as! MainViewController
        let findViewController = FindCofigurator.createFindModule()

        vc.navigationController?.pushViewController(findViewController, animated: true)
    }
    
}
