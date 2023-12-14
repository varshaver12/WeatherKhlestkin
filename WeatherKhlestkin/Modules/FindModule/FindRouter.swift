//
//  FindRouter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit

// MARK: Router Input (Presenter -> Router)
protocol FindRouterProtocol {
    func popToRootViewController(view: FindViewProtocol?)
}

class FindRouter: FindRouterProtocol {
    
    func popToRootViewController(view: FindViewProtocol?) {
        
        let viewController = view as! FindViewController
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
