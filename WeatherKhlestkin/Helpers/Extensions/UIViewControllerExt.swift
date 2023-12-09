//
//  UIViewControllerExt.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 09.12.2023.
//

import UIKit

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
