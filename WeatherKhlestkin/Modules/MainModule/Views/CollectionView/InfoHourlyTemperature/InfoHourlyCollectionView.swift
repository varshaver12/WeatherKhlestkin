//
//  InfoHourlyCollectionView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 12.12.2023.
//

import UIKit

class InfoHourlyCollectionView: UICollectionView {
    
    var hourlyTempCollectionCellDidLoad: ((HourlyTempCollectionCell, IndexPath) -> Void)?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension InfoHourlyCollectionView {
    
    private func setupViews() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        dataSource = self
        delegate = self
        register(HourlyTempCollectionCell.self, forCellWithReuseIdentifier: String(describing: HourlyTempCollectionCell.self))
    }
}

//MARK: - UICollectionViewDataSource

extension InfoHourlyCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCollectionView = self.dequeueReusableCell(withReuseIdentifier: String(describing: HourlyTempCollectionCell.self), for: indexPath)
        guard let cell = cellCollectionView as? HourlyTempCollectionCell else {
            fatalError(
                "Failed to dequeue a cell with identifier \(String(describing: HourlyTempCollectionCell.self))"
            )
        }
        
        if let hourlyCellDidLoad = self.hourlyTempCollectionCellDidLoad {
            hourlyCellDidLoad(cell, indexPath)
        } else {
            return cell
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension InfoHourlyCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: self.frame.height)
    }
}

