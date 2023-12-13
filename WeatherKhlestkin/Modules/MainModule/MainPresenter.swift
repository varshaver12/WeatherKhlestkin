//
//  MainPresenter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
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
    func viewWillAppear() {
        interactor?.fetchWeatherData()
    }

    func viewDidLoad() {
        
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
    func handleResult(_ response: APIWeatherData, cityName: String) {

        let weatherModel = CurrentWeather.getViewModels(with: response)

        view?.setupUI(with: weatherModel, cityName: cityName)
        view?.reloadCollectionView()
        print("🧘🏻‍♂️")
    }
}
