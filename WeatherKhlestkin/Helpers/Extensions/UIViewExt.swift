//
//  UIViewExt.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

extension UIView {

    @objc func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
