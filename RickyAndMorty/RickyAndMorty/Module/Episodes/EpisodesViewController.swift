//
//  EpisodesViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SwiftUI

final class EpisodesViewController: UIViewController {
    enum EventType {
        case detail
    }
    // MARK: - Property
    var viewModel: EpisodeViewModelDelegate!
    var didSendEventHandler: ((EpisodesViewController.EventType) -> Void)?
    private var episodesEventType: EventType = .detail
   // private let headerView = EpisodesHeaderView()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    private var dataSource: UICollectionViewDiffableDataSource<Int, Int>!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.setupUI()
        self.setupCollectionView()
        self.setupDataSource()
    }
}
//MAR
private extension EpisodesViewController {
    private func setupUI() {
//        view.addSubview(self.headerView)
//        self.headerView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
        view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
//            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
// MARK: - setupCollectionView
private extension EpisodesViewController {
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .clear
    }
}
// MARK: - UICollectionViewDiffableDataSource
private extension EpisodesViewController {
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {
                fatalError("Failed to dequeue cell")
            }
            let cellView = ViewForCollectionCell()
            cell.contentView.addSubview(cellView)
            cellView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            return cell
        }
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(Array(0..<3), toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension EpisodesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 360)
    }
}
