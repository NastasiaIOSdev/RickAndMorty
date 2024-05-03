//
//  FavoritesAssembly.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//
import UIKit

final class FavoritesAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getFaviritesView()
    }
}
