//
//  InfoHourlyCollectionReusabbleView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import UIKit

class InfoHourlyCollectionReusabbleView: UICollectionReusableView {
    
    //MARK: - Properties

    lazy var infoHourlyCollectionView: InfoHourlyCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let view = InfoHourlyCollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureAppearance()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - Setup Views

extension InfoHourlyCollectionReusabbleView {
    
    private func setupViews() {
        setupView(infoHourlyCollectionView)
    }
    
    private func configureAppearance() {
        backgroundColor = .clear
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            infoHourlyCollectionView.topAnchor.constraint(equalTo: topAnchor),
            infoHourlyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoHourlyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoHourlyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
