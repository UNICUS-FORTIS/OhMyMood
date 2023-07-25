//
//  Status.swift
//  EmotionApp
//
//  Created by LOUIE MAC on 2023/07/25.
//

import UIKit


struct Status {
    let title: String
    let score: Int
    
    enum bgColor: Int {
        case first = 1
        case second = 2
        case third = 3
        case fourth = 4
        case fifth = 5
        
        
        var backgroundColor: UIColor {
            switch self {
            case .first :
                return UIColor(red: 0.92, green: 0.59, blue: 0.58, alpha: 1.00)
            case .second :
                return UIColor(red: 0.98, green: 0.82, blue: 0.76, alpha: 1.00)
            case .third :
                return UIColor(red: 1.00, green: 0.95, blue: 0.74, alpha: 1.00)
            case .fourth :
                return UIColor(red: 0.76, green: 0.88, blue: 0.77, alpha: 1.00)
            case .fifth :
                return UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
            }
        }
    }
}
