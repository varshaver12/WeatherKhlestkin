//
//  InfoHourlyCollectionView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import UIKit

class InfoHourlyCollectionView: UICollectionView {
    
    //MARK: - CallBack
    
    var additionalInfoCollectionCellDidLoad: ((AdditionalInfoCollectionCell, IndexPath) -> Void)?
    var hourlyTempCollectionCellDidLoad: ((HourlyTempCollectionCell, IndexPath) -> Void)?
    
    //MARK: - Init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: - Setup Views

extension InfoHourlyCollectionView {
    
    private func setupViews() {
        register(AdditionalInfoCollectionCell.self,
                 forCellWithReuseIdentifier: String(describing: AdditionalInfoCollectionCell.self))
        register(HourlyTempCollectionCell.self,
                 forCellWithReuseIdentifier: String(describing: HourlyTempCollectionCell.self))
    }
    
    private func configureAppearance() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
    }
}

//MARK: - UICollectionViewDataSource

extension InfoHourlyCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cellCollectionView = self.dequeueReusableCell(withReuseIdentifier: String(describing: AdditionalInfoCollectionCell.self),
                                                for: indexPath)
            guard let cell = cellCollectionView as? AdditionalInfoCollectionCell else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(String(describing: AdditionalInfoCollectionCell.self))"
                )
            }
            if let additionalInfoCollectionCellDidLoad = self.additionalInfoCollectionCellDidLoad {
                additionalInfoCollectionCellDidLoad(cell, indexPath)
            } else {
                return cell
            }
        } else {
            let cellCollectionView = self.dequeueReusableCell(withReuseIdentifier: String(describing: HourlyTempCollectionCell.self),
                                                for: indexPath)
            guard let cell = cellCollectionView as? HourlyTempCollectionCell else {
                fatalError(
                    "Failed to dequeue a cell with identifier \(String(describing: HourlyTempCollectionCell.self))"
                )
            }
            
            if let hourlyTempCollectionCellDidLoad = self.hourlyTempCollectionCellDidLoad {
                hourlyTempCollectionCellDidLoad(cell, indexPath)
            } else {
                return cell
            }
        }
        let cell = UICollectionViewCell()
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension InfoHourlyCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: self.frame.height)
    }
}
