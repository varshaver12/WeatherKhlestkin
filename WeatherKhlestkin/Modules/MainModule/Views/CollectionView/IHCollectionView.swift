//
//  IHCollectionView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import  UIKit

class IHCollectionView: UICollectionView {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let dailyCellHeightRatio = CGFloat(0.42)
        static let summaryCellHeightRatio = CGFloat(0.1)
        static let subInfoCellHeightRatio = CGFloat(0.25)
    }
    
    // MARK: - Callback
    
    var hourlyCollectionDidLoad: ((InfoHourlyCollectionReusabbleView) -> Void)? 

    
    //MARK: - Init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        hourlyCollectionDidLoad = nil

    }
}

//MARK: - Setup Views

extension IHCollectionView {
    
    private func setupViews() {
        dataSource = self
        delegate = self
        
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
        
        configureSubViews()
    }
    
    private func configureSubViews() {
        register(InfoHourlyCollectionReusabbleView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: String(describing: InfoHourlyCollectionReusabbleView.self))
    }
}

//MARK: - UICollectionViewDataSource

extension IHCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = self.dequeueReusableSupplementaryView(ofKind: kind,
                                                           withReuseIdentifier: String(describing: InfoHourlyCollectionReusabbleView.self),
                                                           for: indexPath) as! InfoHourlyCollectionReusabbleView
        
        if let hourlyCollectionDidLoad = hourlyCollectionDidLoad {
            hourlyCollectionDidLoad(header)
        } else {
            return header
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return UICollectionViewCell()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension IHCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}
