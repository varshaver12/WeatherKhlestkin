//
//  FindRouter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit

protocol FindRouterProtocol {
    func popToMainViewController(view: FindViewProtocol?)
}

class FindRouter: FindRouterProtocol {
    
    func popToMainViewController(view: FindViewProtocol?) {
        
        let viewController = view as! FindViewController
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
