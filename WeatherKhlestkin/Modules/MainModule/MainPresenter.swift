//
//  MainPresenter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func findButtonDidTap()
    func favoritesListButtonDidTap()
}

final class MainPresenter {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
}

// MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        self.view.setupUIBinding(cityName: "Москва", temperature: "-32 🌨️", temperatureNote: "Холодновато")
    }
    
    func findButtonDidTap() {
        router?.pushToFindViewController(view: view)
    }
    
    func favoritesListButtonDidTap() {
        router?.pushToFavoritesViewController(view: view)
    }
}

// MARK: - MainInteractorOutputProtocol
extension MainPresenter: MainInteractorOutputProtocol {

}
