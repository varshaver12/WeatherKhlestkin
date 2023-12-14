//
//  FindViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import UIKit


protocol FindViewProtocol {
   func reloadTableView()
}

class FindViewController: BaseViewController {
    
    var presenter: FindPresenterProtocol?
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Введите название города"
        searchBar.tintColor = .gray
        return searchBar
    }()
    
    private lazy var searchTableView: UITableView = {
        let searchTableView = UITableView()
        searchTableView.separatorStyle = .none
        searchTableView.backgroundColor = .white
        return searchTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    
    override func setupViews() {
        searchBar.delegate = self
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        view.backgroundColor = .white
        showNavigationBar()

        view.setupView(searchBar)
        view.setupView(searchTableView)
        setupConstraints()
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60),
            
            searchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
}

extension FindViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        
        presenter?.configureCell(cell, forRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTableViewRow(at: indexPath)
    }
}

extension FindViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.textDidChange(searchText: searchText)
    }
}

extension FindViewController: FindViewProtocol{
    func reloadTableView() {
        searchTableView.reloadData()
    }
}
