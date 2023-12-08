//
//  BaseViewController.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

class BaseViewController : UIViewController {
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup Views
    
    func setupViews() {
        view.backgroundColor = .gray
    }
    
    func setupConstraints() {
        
    }
}
