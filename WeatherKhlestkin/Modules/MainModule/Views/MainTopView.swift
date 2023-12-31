//
//  MainTopView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

final class MainTopView: BaseView {
    
    var findButtonDidTap: (() -> ())?

    private let configuration = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular, scale: .default)
    private lazy var findLocationButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: configuration), for: .normal)
        button.addTarget(self, action: #selector(findButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 25)
        label.textColor = Resouces.Colors.cityName
        label.textAlignment = .center
        label.numberOfLines = 0
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

extension MainTopView {
    override func setupViews() {
        super.setupViews()
        
        setupView(cityName)
        setupView(temperature)
        setupView(temperatureNote)
        setupView(findLocationButton)
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
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
    }
}

extension MainTopView {
    func configure(cityName: String, currentWeather: [CurrentWeather]) {
        guard let firstData = currentWeather.first else { return }
        
        self.cityName.text = cityName
        self.temperature.text = firstData.tempOriginal
        self.temperatureNote.text = firstData.description
    }
}

@objc extension MainTopView {

    private func findButtonTap() {
        guard let findButtonTap = findButtonDidTap else { return }
        findButtonTap()
    }
    
}
