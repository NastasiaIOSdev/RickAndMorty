//
//  AppFonts.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//
import Foundation
import UIKit

enum AppFonts {
    case regular14
    case regular16
    case regular32
    case medium14
    case medium20
    case bold16
    case bold18
    case bold24
    var font: UIFont? {
        switch self {
        case .regular14:
            return UIFont(name: "Roboto-Regular", size: 14)
        case .regular16:
            return UIFont(name: "Roboto-Regular", size: 16)
        case .regular32:
            return UIFont(name: "Roboto-Regular", size: 32)
        case .medium14:
            return UIFont(name: "Roboto-Medium", size: 14)
        case .medium20:
            return UIFont(name: "Roboto-Medium", size: 20)
        case .bold16:
            return UIFont(name: "Roboto-Bold", size: 16)
        case .bold18:
            return UIFont(name: "Roboto-Bold", size: 18)
        case .bold24:
            return UIFont(name: "Roboto-Bold", size: 24)
        }
    }
}
