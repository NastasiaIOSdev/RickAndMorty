//
//  EpisodesAssembly.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit

final class EpisodesAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getEpisodesView()
    }
}
