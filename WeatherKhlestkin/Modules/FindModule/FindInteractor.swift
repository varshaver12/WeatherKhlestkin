//
//  FindInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import Foundation

protocol FindInteractorProtocol: AnyObject {
    
}

protocol FindInteractorOutputProtocol: AnyObject {
    
}

final class FindInteractor {
    
    weak var presenter: FindInteractorOutputProtocol!
    

    
    required init(presenter: FindInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension FindInteractor: FindInteractorProtocol {

}
