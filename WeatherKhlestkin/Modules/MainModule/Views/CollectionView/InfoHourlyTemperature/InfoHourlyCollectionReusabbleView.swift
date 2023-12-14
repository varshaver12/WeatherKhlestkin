//
//  InfoHourlyCollectionReusabbleView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import UIKit

class InfoHourlyCollectionReusabbleView: UICollectionReusableView {
    
    lazy var hourlyCollectionView: InfoHourlyCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let view = InfoHourlyCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension InfoHourlyCollectionReusabbleView {
    
    private func setupViews() {
        backgroundColor = .clear
        setupView(hourlyCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hourlyCollectionView.topAnchor.constraint(equalTo: topAnchor),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hourlyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

    }
}
