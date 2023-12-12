//
//  IHCollectionView.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 11.12.2023.
//

import  UIKit

class IHCollectionView: UICollectionView {

    // MARK: - Callback

    var infoHourlyCollectionDidLoad: ((InfoHourlyCollectionReusabbleView) -> Void)?
    
    //MARK: - Init
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        configureAppearance()
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        infoHourlyCollectionDidLoad = nil
    }
}

//MARK: - Setup Views

extension IHCollectionView {
    
    private func configureAppearance() {
        dataSource = self
        delegate = self
        
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
    }
    
    private func configureViews() {
        register(InfoHourlyCollectionReusabbleView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: String(describing: InfoHourlyCollectionReusabbleView.self))
        
    }
}

//MARK: - UICollectionViewDataSource

extension IHCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let topHorizontalCollection = self.dequeueReusableSupplementaryView(ofKind: kind,
                                                           withReuseIdentifier: String(describing: InfoHourlyCollectionReusabbleView.self),
                                                           for: indexPath) as! InfoHourlyCollectionReusabbleView
        
        if let infoHourlyCollectionDidLoad = infoHourlyCollectionDidLoad {
            infoHourlyCollectionDidLoad(topHorizontalCollection)
        } else {
            return topHorizontalCollection
        }
        
        return topHorizontalCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            return UICollectionViewCell()
        case 1:
            return UICollectionViewCell()
        case 2:
            return UICollectionViewCell()
        default:
            break
        }
        
        return UICollectionViewCell()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension IHCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width,
                          height: UIScreen.main.bounds.height * 0.4)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width,
                          height: UIScreen.main.bounds.height * 0.1)
        case 2:
            return CGSize(width: UIScreen.main.bounds.width,
                          height: UIScreen.main.bounds.height * 0.3)
        default:
            break
        }
        
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}
