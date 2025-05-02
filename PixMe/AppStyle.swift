//
//  AppStyle.swift
//  PixMe
//
//  Created by Liza on 01/05/2025.
//

import UIKit

struct AppStyle {
    
    struct Colors {
        static var background: UIColor {
            UIColor(light: "#F8F8FC", dark: "#181520")
        }

        static var backgroundSecondary: UIColor {
            UIColor(light: "#E8E8F2", dark: "#232030")
        }

        static var accent: UIColor {
            UIColor(light: "#8E7BAA", dark: "#B39DDB")
        }

        static var textPrimary: UIColor {
            UIColor(light: "#1A1A1A", dark: "#DDD9E8")
        }

        static var textSecondary: UIColor {
            UIColor(light: "#444444", dark: "#AAAAAA")
        }

        static var placeholder: UIColor {
            UIColor(light: "#1A1A1A", dark: "#DDD9E8").withAlphaComponent(0.25)
        }

        static var border: UIColor {
            UIColor(light: "#D4D3E0", dark: "#3D394D")
        }

        static var buttonSecondaryText: UIColor {
            UIColor(light: "#5A69FF", dark: "#7D8BFF")
        }
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



extension UIColor {
    convenience init(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0x0000FF) / 255

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    convenience init(light: String, dark: String) {
        self.init { traitCollection in
            return traitCollection.userInterfaceStyle == .dark
                ? UIColor(hex: dark)
                : UIColor(hex: light)
        }
    }
}


extension UITextField {
    func applyInputFieldStyle(placeholder: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .none
        self.layer.cornerRadius = AppStyle.Metrics.cornerRadius
        self.layer.borderWidth = AppStyle.Metrics.borderWidth
        self.layer.borderColor = AppStyle.Colors.border.cgColor
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: AppStyle.Metrics.textFieldLeftPadding, height: AppStyle.Metrics.textFieldHeight))
        self.leftViewMode = .always
        self.backgroundColor = AppStyle.Colors.background
        self.textColor = AppStyle.Colors.textPrimary
        self.font = AppStyle.Fonts.textField
        self.placeholder = placeholder
    }
}


