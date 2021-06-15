//
//  Chat.swift
//  SplitViewController
//
//  Created by Sergey Sokolkin on 15.06.2021.
//  Copyright © 2021 Siarhei Sakolkin. All rights reserved.
//

import UIKit

enum Color {
    
    case green, pink, blue, orange, teal
    
    var uicolor: UIColor {
        switch self {
        case .green: return .systemGreen
        case .pink: return .systemPink
        case .blue: return .systemBlue
        case .orange: return .systemOrange
        case .teal: return .systemTeal
        }
    }
    
}

struct Chat {
    
    let name: String
    let description: String
    let iconName: String
    let color: Color
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
    
}
