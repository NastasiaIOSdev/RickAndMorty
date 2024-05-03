//
//  FaviritesViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit

final class FavoritesViewController: UIViewController {
// MARK: - Property
    var viewModel: FavoritesViewModelDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
    }
}
