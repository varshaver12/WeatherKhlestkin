//
//  AdditionalInfoCollectionCell.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import UIKit

class AdditionalInfoCollectionCell: UICollectionViewCell {
    
    //MARK: - Properties
    // Ветер
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    private lazy var windImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "wind")
        return imageView
    }()
    // Давление
    private lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    private lazy var pressureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "timer")
        return imageView
    }()
    // Влажность
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    private lazy var humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "humidity")
        return imageView
    }()
    // Ощущается как
    private lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.font = Resouces.Fonts.helvelticaRegular(with: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    private lazy var feelsLikeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "thermometer.low")
        return imageView
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

extension AdditionalInfoCollectionCell {
    private func setupViews() {
        setupView(windLabel)
        setupView(windImageView)
        setupView(pressureLabel)
        setupView(pressureImageView)
        setupView(humidityLabel)
        setupView(humidityImageView)
        setupView(feelsLikeLabel)
        setupView(feelsLikeImageView)
    }
    
    private func constaintViews() {
        NSLayoutConstraint.activate([
            windImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            windImageView.topAnchor.constraint(equalTo: topAnchor),
            windImageView.widthAnchor.constraint(equalToConstant: 10),
            windImageView.heightAnchor.constraint(equalToConstant: 10),
            
            windLabel.leadingAnchor.constraint(equalTo: windImageView.trailingAnchor, constant: 5),
            windLabel.topAnchor.constraint(equalTo: topAnchor),
            windLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            windLabel.heightAnchor.constraint(equalToConstant: 10),
            
            pressureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            pressureImageView.topAnchor.constraint(equalTo: windImageView.bottomAnchor, constant: 5),
            pressureImageView.widthAnchor.constraint(equalToConstant: 10),
            pressureImageView.heightAnchor.constraint(equalToConstant: 10),
            
            pressureLabel.leadingAnchor.constraint(equalTo: pressureImageView.trailingAnchor, constant: 5),
            pressureLabel.topAnchor.constraint(equalTo: windImageView.bottomAnchor, constant: 5),
            pressureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            pressureLabel.heightAnchor.constraint(equalToConstant: 10),
            
            humidityImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            humidityImageView.topAnchor.constraint(equalTo: pressureImageView.bottomAnchor, constant: 5),
            humidityImageView.widthAnchor.constraint(equalToConstant: 10),
            humidityImageView.heightAnchor.constraint(equalToConstant: 10),
            
            humidityLabel.leadingAnchor.constraint(equalTo: humidityImageView.trailingAnchor, constant: 5),
            humidityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: 5),
            humidityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            humidityLabel.heightAnchor.constraint(equalToConstant: 10),
            
            feelsLikeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            feelsLikeImageView.topAnchor.constraint(equalTo: humidityImageView.bottomAnchor, constant: 5),
            feelsLikeImageView.widthAnchor.constraint(equalToConstant: 10),
            feelsLikeImageView.heightAnchor.constraint(equalToConstant: 10),
            
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeImageView.trailingAnchor, constant: 5),
            feelsLikeLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 5),
            feelsLikeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func configureAppearance() {
        backgroundColor = .clear
    }
}

//MARK: - Configure Cell

extension AdditionalInfoCollectionCell {
    
    // TODO: Исправить на работу с моделью
    func configureCell(windStr: String, pressureStr: String, humidityStr: String, feelsLikeStr: String) {
        windLabel.text = windStr
        pressureLabel.text = pressureStr
        humidityLabel.text = humidityStr
        feelsLikeLabel.text = feelsLikeStr
    }
    
}
