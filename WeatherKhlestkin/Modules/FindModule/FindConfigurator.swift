//
//  FindConfigurator.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import Foundation
import UIKit

protocol FindConfiguratorProtocol: AnyObject {
    func configure(with viewController: FindViewController)
}

final class FindCofigurator: FindConfiguratorProtocol {
    func createFindModule() -> UIViewController {
        let viewController = FindViewController()
        
        let presenter: FindPresenterProtocol & FindInteractorOutputProtocol = FindPresenter(view: viewController)
    }
}
