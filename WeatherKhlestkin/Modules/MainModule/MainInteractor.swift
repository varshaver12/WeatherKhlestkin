//
//  MainInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {

}

protocol MainInteractorOutputProtocol: AnyObject {

}

final class MainInteractor {
    
    weak var presenter: MainInteractorOutputProtocol!
    
    required init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension MainInteractor: MainInteractorProtocol {

}
