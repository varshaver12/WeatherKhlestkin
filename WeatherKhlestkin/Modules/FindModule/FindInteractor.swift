//
//  FindInteractor.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import MapKit
import Foundation

protocol FindInteractorProtocol {
    
    var presenter: FindInteractorOutputProtocol? { get set }
    
    func setDelegate()
    func searchResultsCount() -> Int
    func searchResultsText(indexPath: IndexPath) -> String
    func saveSelectedResult(indexPath: IndexPath)
    func enterQueryFragment(with searchText: String)
}

protocol FindInteractorOutputProtocol {
    func reloadTableView()
    func popToRootViewController()
}

class FindInteractor: NSObject {

    var presenter: FindInteractorOutputProtocol?
    
    private var searchResults = [MKLocalSearchCompletion]()
    private var searchCompleter = MKLocalSearchCompleter()
}

extension FindInteractor: FindInteractorProtocol {
    func setDelegate() {
        searchCompleter.delegate = self
    }
    
    func searchResultsCount() -> Int {
        return searchResults.count
    }
    
    func searchResultsText(indexPath: IndexPath) -> String {
        let searchResult = searchResults[indexPath.row]
        return searchResult.title
    }
    
    func saveSelectedResult(indexPath: IndexPath) {
        let selectedResult = searchResults[indexPath.row]
        
        let searchRequest = MKLocalSearch.Request(completion: selectedResult)
        let search = MKLocalSearch(request: searchRequest)

        search.start { (response, error) in
            guard error == nil else { return }
            guard let placeMark = response?.mapItems[0].placemark else { return }
            guard let locationName = placeMark.name else { return }
            let locationLatitude: Double = placeMark.coordinate.latitude
            let locationLongitude: Double = placeMark.coordinate.longitude
            
            DataManager.shared.saveCityName(for: "locationName", with: locationName)
            DataManager.shared.saveCoord(for: "locationLatitude", with: locationLatitude)
            DataManager.shared.saveCoord(for: "locationLongitude", with: locationLongitude)
            self.presenter?.popToRootViewController()
        }
    }
    
    func enterQueryFragment(with searchText: String) {
        if searchText == "" {
            searchResults.removeAll()
            presenter?.reloadTableView()
        }
        searchCompleter.queryFragment = searchText
    }
}

extension FindInteractor: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        presenter?.reloadTableView()
    }
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Cancel")
    }
}
