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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
    }
}

