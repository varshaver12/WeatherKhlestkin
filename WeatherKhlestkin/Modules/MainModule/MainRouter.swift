//
//  MainRouter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainRouterProtocol: AnyObject {

}

final class MainRouter {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
}

extension MainRouter: MainRouterProtocol {

}
