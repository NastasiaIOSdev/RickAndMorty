//
//  CollectionViewCellWithView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 11.05.2024.
//

import UIKit
import SnapKit

final class CollectionViewCellWithView: UICollectionViewCell {
    override var contentView: UIView {
        return super.contentView
    }
    func configure(with view: UIView) {
        self.contentView.subviews.forEach { $0.removeFromSuperview() }
        self.contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
