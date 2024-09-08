//
//  CharacterDetailViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
// MARK: - Property
    var viewModel: ChatacterDetailViewModelDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
    }
}
