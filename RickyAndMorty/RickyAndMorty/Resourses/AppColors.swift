//
//  Colors.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//
import UIKit

enum AppColors {
    static let appBlue = UIColor().hex(0xE3F2FD)
    static let lightGrey = UIColor().hex(0xF9F9F9)
    static let blue = UIColor().hex(0x309CFF)
}
extension UIColor {
    func hex(_ rgbValue: UInt64) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
