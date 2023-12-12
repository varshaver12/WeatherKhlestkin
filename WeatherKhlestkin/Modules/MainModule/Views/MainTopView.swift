//
//  MainTopView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

final class MainTopView: BaseView {
    
    // MARK: - Callback
    
    var findButtonDidTap: (() -> ())?
    var favoritesListButtonDidTap: (() -> ())?
    
    
    //MARK: - Properties
    
    private let configuration = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .default)
    private lazy var findLocationButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: configuration), for: .normal)
        button.addTarget(self, action: #selector(findButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoritesListButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "text.badge.star", withConfiguration: configuration), for: .normal)
        button.addTarget(self, action: #selector(favoritesListButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 25)
        label.textColor = Resouces.Colors.cityName
        label.textAlignment = .center
        return label
    }()
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 36)
        label.textColor = Resouces.Colors.cityName
        label.textAlignment = .center
        return label
    }()
    private lazy var temperatureNote: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 20)
        label.textColor = Resouces.Colors.cityName
        label.textAlignment = .center
        return label
    }()
}

//MARK: - Setup Views

extension MainTopView {
    override func setupViews() {
        super.setupViews()
        
        setupView(cityName)
        setupView(temperature)
        setupView(temperatureNote)
        setupView(findLocationButton)
        setupView(favoritesListButton)
    }
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperature.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12),
            temperature.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperature.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperature.heightAnchor.constraint(equalToConstant: 30),
            
            cityName.bottomAnchor.constraint(equalTo: temperature.topAnchor, constant: -10),
            cityName.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityName.trailingAnchor.constraint(equalTo: trailingAnchor),
            cityName.heightAnchor.constraint(equalToConstant: 40),
            
            temperatureNote.topAnchor.constraint(equalTo: temperature.bottomAnchor, constant: 10),
            temperatureNote.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureNote.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperatureNote.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureNote.heightAnchor.constraint(equalToConstant: 30),
            
            findLocationButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            findLocationButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            
            
            favoritesListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            favoritesListButton.topAnchor.constraint(equalTo: topAnchor, constant: 70)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
    }
}

//MARK: - Configure View

extension MainTopView {
    func configure(cityName: String, temperature: String, temperatureNote: String) {
        self.cityName.text = cityName
        self.temperature.text = temperature
        self.temperatureNote.text = temperatureNote
    }
}

//MARK: - Selector

@objc extension MainTopView {

    private func findButtonTap() {
        guard let findButtonTap = findButtonDidTap else { return }
        findButtonTap()
    }
    
    private func favoritesListButtonTap() {
        
        guard let favoritesListButtonTap = favoritesListButtonDidTap else { return }
        favoritesListButtonTap()
    }
}
