//
//  HourlyTempCollectionCell.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import UIKit

class HourlyTempCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    // Ветер
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "wind")
        return imageView
    }()
    // Давление
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HourlyTempCollectionCell {
    private func setupViews() {
        setupView(hourLabel)
        setupView(weatherImageView)
        setupView(temperatureLabel)
    }
    
    private func constaintViews() {
        NSLayoutConstraint.activate([
            hourLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            hourLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherImageView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 10),
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImageView.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: 10),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
    
    private func configureAppearance() {
        backgroundColor = .clear
    }
}

//MARK: - Configure Cell

extension HourlyTempCollectionCell {
    
    // TODO: Исправить на работу с моделью
    func configureCell(hourStr: String, weatherStr: String, temperatureStr: String) {
        hourLabel.text = hourStr
        weatherImageView.image = UIImage()
        temperatureLabel.text = temperatureStr
    }
    
}
