//
//  EpisodesViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit

final class EpisodesViewController: UIViewController {
    enum EventType {
        case detail
    }
// MARK: - Property
    var viewModel: EpisodeViewModelDelegate!
    var didSendEventHandler: ((EpisodesViewController.EventType) -> Void)?
    private var episodesEventType: EventType = .detail
    private let headerView = EpisodesHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.setupUI()
    }
}
private extension EpisodesViewController {
    private func setupUI() {
        view.addSubview(self.headerView)
        self.headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}
