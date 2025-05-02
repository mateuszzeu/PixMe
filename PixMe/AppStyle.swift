//
//  AppStyle.swift
//  PixMe
//
//  Created by Liza on 01/05/2025.
//

import UIKit

struct AppStyle {
    
    struct Colors {
        static let background = UIColor.systemBackground
        
        static let textPrimary = UIColor.label
        static let textSecondary = UIColor.secondaryLabel
        static let placeholder = UIColor.label.withAlphaComponent(0.25)
        
        static let buttonSecondaryText = UIColor.systemBlue
        static let border = UIColor.quaternaryLabel
    }

    struct Fonts {
        static let textField = UIFont.systemFont(ofSize: 15)
        
        static let buttonPrimary = UIFont.systemFont(ofSize: 18)
        static let buttonSecondary = UIFont.systemFont(ofSize: 14)
        
        static let labelSmall = UIFont.systemFont(ofSize: 13)
        static let labelTiny = UIFont.systemFont(ofSize: 10)
    }

    struct Metrics {
        static let cornerRadius: CGFloat = 16
        static let textFieldHeight: CGFloat = 35
        static let borderWidth: CGFloat = 0.5
        static let textFieldLeftPadding: CGFloat = 12
        static let labelFaintAlpha: CGFloat = 0.5
    }
}


