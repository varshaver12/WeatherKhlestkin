//
//  FindInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import MapKit
import Foundation

// MARK: Interactor Input (Presenter -> Interactor)
protocol FindInteractorProtocol {
    
    var presenter: FindInteractorOutputProtocol? { get set }
    
    func deliverDelegate()
    func locationSearchResultsCount() -> Int
    func searchResultsText(indexPath: IndexPath) -> String
    func saveSelectedLocationData(indexPath: IndexPath)
    func enterQueryFragment(with searchText: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol FindInteractorOutputProtocol {
    func reloadTableView()
    func popToRootViewController()
}

class FindInteractor: NSObject {

    // MARK: Properties
    var presenter: FindInteractorOutputProtocol?
    
    private var searchResults = [MKLocalSearchCompletion]()
    private var searchCompleter = MKLocalSearchCompleter()

}

//MARK: -> Interactor

extension FindInteractor: FindInteractorProtocol {
    func deliverDelegate() {
        searchCompleter.delegate = self
    }
    
    // numberOfRows
    func locationSearchResultsCount() -> Int {
        return searchResults.count
    }
    
    // cellForRowAt / configureCell
    func searchResultsText(indexPath: IndexPath) -> String {
        let searchResult = searchResults[indexPath.row]
        return searchResult.title
    }
    
    // didSelectTableViewRow
    func saveSelectedLocationData(indexPath: IndexPath) {
        let selectedResult = searchResults[indexPath.row]
        
        let searchRequest = MKLocalSearch.Request(completion: selectedResult)
        let search = MKLocalSearch(request: searchRequest)

        // find the location name, latitude and, longitude
        search.start { (response, error) in
            guard error == nil else { return }
            guard let placeMark = response?.mapItems[0].placemark else { return }
            guard let locationName = placeMark.name else { return }
            let locationLatitude: Double = placeMark.coordinate.latitude
            let locationLongitude: Double = placeMark.coordinate.longitude
            
            DataManager.shared.saveCityName(for: "locationName", with: locationName)
            DataManager.shared.saveCoord(for: "locationLatitude", with: locationLatitude)
            DataManager.shared.saveCoord(for: "locationLongitude", with: locationLongitude)
            // go back to RootViewController
            self.presenter?.popToRootViewController()
        }
    }
    
    // textDidChange
    func enterQueryFragment(with searchText: String) {
        if searchText == "" {
            searchResults.removeAll()
            presenter?.reloadTableView()
        }
        // The text entered by the user in the search bar is put into the auto-completion target.
        searchCompleter.queryFragment = searchText
    }
}

//MARK: - MKLocalSearchCompleterDelegate

extension FindInteractor: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // update search results
        searchResults = completer.results
        presenter?.reloadTableView()
    }
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Cancel")
    }
}
