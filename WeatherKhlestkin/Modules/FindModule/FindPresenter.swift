//
//  FindPresenter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import Foundation

protocol FindPresenterProtocol: AnyObject {

}

final class FindPresenter {
    
    weak var view: FindViewProtocol!
    var interactor: FindInteractorProtocol!
    var router: FindRouterProtocol!
    
    required init(view: FindViewProtocol) {
        self.view = view
    }
}

// MARK: - FindPresenterProtocol
extension FindPresenter: FindPresenterProtocol {
    func viewWillAppear() {
        
    }

}

// MARK: - MainInteractorOutputProtocol
extension FindPresenter: FindInteractorOutputProtocol {

}
