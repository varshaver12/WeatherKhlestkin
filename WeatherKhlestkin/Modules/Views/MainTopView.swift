//
//  MainTopView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

final class MainTopView: BaseView {
    
    //MARK: - Properties
    
    private lazy var cityName: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resouces.Colors.cityName
        return label
    }()
    private lazy var temperature: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resouces.Colors.cityName
        return label
    }()
    private lazy var temperatureNote: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resouces.Colors.cityName
        return label
    }()
}

//MARK: - Setup Views

extension MainTopView {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .orange
        setupView(cityName)
        setupView(temperature)
        setupView(temperatureNote)
    }
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            cityName.bottomAnchor.constraint(equalTo: temperatureNote.topAnchor, constant: -CGFloat(10)),
            cityName.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityName.trailingAnchor.constraint(equalTo: trailingAnchor),
            cityName.heightAnchor.constraint(equalToConstant: 40),
            
            temperature.topAnchor.constraint(equalTo: temperatureNote.bottomAnchor, constant: -CGFloat(10)),
            temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperature.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperature.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperature.heightAnchor.constraint(equalToConstant: 60),
            
            temperatureNote.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureNote.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperatureNote.leadingAnchor.constraint(equalTo: leadingAnchor),
            temperatureNote.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureNote.heightAnchor.constraint(equalToConstant: 30)
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
