//
//  HourlyTempCollectionCell.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import UIKit

class HourlyTempCollectionCell: UICollectionViewCell {
    

    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension HourlyTempCollectionCell {
    
    private func configureAppearance() {
        backgroundColor = .clear
    }
    
    private func setupViews() {

        setupView(hourLabel)
        setupView(weatherImageView)
        setupView(temperatureLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            hourLabel.topAnchor.constraint(equalTo: topAnchor),
            hourLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            hourLabel.heightAnchor.constraint(equalToConstant: 15),
            
            weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 10),
            weatherImageView.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -10),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        

    }
}

extension HourlyTempCollectionCell {
    
    func configureCell(currentWeather: [CurrentWeather], item: Int) {
        hourLabel.text = currentWeather[item].hour
        weatherImageView.image = UIImage(named: currentWeather[item].conditionImage)
        temperatureLabel.text = currentWeather[item].temp
    }
}
