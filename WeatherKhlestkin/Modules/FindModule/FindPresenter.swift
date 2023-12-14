//
//  FindPresenter.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit

protocol FindPresenterProtocol {
    
    var view: FindViewProtocol? { get set }
    var interactor: FindInteractorProtocol? { get set }
    var router: FindRouterProtocol? { get set }
    
    func viewDidLoad()
    func numberOfRows(in section: Int) -> Int
    func configureCell(_ cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func didSelectTableViewRow(at indexPath: IndexPath)
    func textDidChange(searchText: String)
}

class FindPresenter {
    
    var view: FindViewProtocol?
    var interactor: FindInteractorProtocol?
    var router: FindRouterProtocol?

}

extension FindPresenter: FindPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.setDelegate()
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard let numberOfRows = interactor?.searchResultsCount() else { return 0 }
        return numberOfRows
    }
    
    func configureCell(_ cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = interactor?.searchResultsText(indexPath: indexPath)
    }
    
    func didSelectTableViewRow(at indexPath: IndexPath) {
        interactor?.saveSelectedResult(indexPath: indexPath)
    }
    
    func textDidChange(searchText: String) {
        interactor?.enterQueryFragment(with: searchText)
    }
}

extension FindPresenter: FindInteractorOutputProtocol {
    
    func reloadTableView() {
        view?.reloadTableView()
    }
    
    func popToRootViewController() {
        router?.popToMainViewController(view: view)
    }
}
