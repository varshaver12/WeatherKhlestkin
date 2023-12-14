//
//  DoubleExt.swift
//  WeatherKhlestkin
//
//  Created by 1234 on 13.12.2023.
//

import Foundation

extension Double {
    
    func degToCompass() -> String {
        let val = (Double(self / 22.5)).rounded() 
        let arr = ["С", "ССВ", "СВ", "ВСВ", "В", "ВЮВ", "ЮВ", "ЮЮВ", "Ю", "ЮЮЗ", "ЮЗ", "ЗЮЗ", "З", "ЗСЗ", "СЗ", "ССЗ"]
        return arr[Int(val.truncatingRemainder(dividingBy: 16.0))]
    }
}
