//
//  FaviritesViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SnapKit

final class FavoritesViewController: UIViewController {
    enum EventType {
        case detail
    }
// MARK: - Property
    var viewModel: FavoritesViewModelDelegate!
    var didSendEventHandler: ((EpisodesViewController.EventType) -> Void)?
    private var episodesEventType: EventType = .detail
    private let pageTitle = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.setupUI()
    }
}
// MARK - SetupUi
private extension FavoritesViewController {
    private func setupUI() {
        self.setupTitle()
    }
    private func setupTitle() {
        self.pageTitle.text = Constants.favoritePageTitleTaxt
        self.pageTitle.font = AppFonts.bold24.font
        self.pageTitle.textColor = .black
        view.addSubview(self.pageTitle)
        self.pageTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(41)
            make.centerX.equalToSuperview()
        }
    }
}
