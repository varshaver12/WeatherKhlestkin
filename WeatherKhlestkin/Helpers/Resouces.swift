//
//  Resouces.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 08.12.2023.
//

import UIKit

enum Resouces {
    enum Colors {
        static let cityName = UIColor(hexString: "#437BFE")
    }

    enum Strings {
        enum MainModule {
            
        }
        enum FindModule {
            
        }
        enum FavoritesModule {
            
        }
    }

    enum Images {

    }

    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
