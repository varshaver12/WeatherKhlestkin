//
//  HourlyTempCollectionCell.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import UIKit

class HourlyTempCollectionCell: UICollectionViewCell {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let labelHeight = CGFloat(15)
        static let miniMargin = CGFloat(5)
        static let basicMargin = CGFloat(10)
    }
    
    //MARK: - Properties
    
    // Ветер
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
        imageView.image = UIImage(systemName: "wind")
        return imageView
    }()
    // Давление
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Init
    
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

//MARK: - Setup Views

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
            hourLabel.heightAnchor.constraint(equalToConstant: UI.labelHeight),
            
            weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            weatherImageView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: UI.basicMargin),
            weatherImageView.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -UI.basicMargin),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UI.miniMargin),
            temperatureLabel.heightAnchor.constraint(equalToConstant: UI.labelHeight)
        ])
        

    }
}

//MARK: - Configure Cell

extension HourlyTempCollectionCell {
    
    func configureCell(currentWeather: [CurrentWeather], item: Int) {
        hourLabel.text = currentWeather[item].hour
        weatherImageView.image = UIImage(named: currentWeather[item].conditionImage)
        temperatureLabel.text = currentWeather[item].temp
    }
}
