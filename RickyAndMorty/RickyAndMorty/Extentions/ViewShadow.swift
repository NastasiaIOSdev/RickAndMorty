//
//  ViewShadow.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 04.05.2024.
//
import UIKit

extension UIView {
    func applyShadow(color: UIColor = .black,
                     alpha: Float = 0.24,
                     x: CGFloat = 0,
                     y: CGFloat = 2,
                     blur: CGFloat = 2,
                     spread: CGFloat = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2.0
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        layer.masksToBounds = false
    }
}
