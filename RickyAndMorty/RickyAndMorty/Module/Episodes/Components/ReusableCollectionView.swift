//
//  ReusableCollectionView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SwiftUI

final class ViewForCollectionCell: UIView {
    // MARK: - Property
    private let contentView = UIView()
    private let characterInage = UIImageView()
    private let characterName = UILabel()
    private let contentViewLikeButton = NumberEpisodeLikeView()
    // MARK: - init
    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - SetupUI
private extension ViewForCollectionCell {
    private func setupUI() {
        self.contentView.layer.cornerRadius = 4
        self.contentView.backgroundColor = .white
        self.contentView.applyShadow(color: .black, alpha: 0.24, x: 0, y: 2, blur: 2, spread: 0)
        addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(360)
        }
        self.configcharacterInage()
        self.setupCharacterNameLabel()
        self.setupContentView()
    }
    private func configcharacterInage() {
        self.characterInage.image = UIImage(named: "media")
        self.characterInage.contentMode = .scaleAspectFill
        self.contentView.addSubview(self.characterInage)
        self.characterInage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(232)
        }
    }
    private func setupCharacterNameLabel() {
        self.characterName.text = "Rick Sanchez"
        self.characterName.font = AppFonts.medium20.font
        self.contentView.addSubview(self.characterName)
        self.characterName.snp.makeConstraints { make in
            make.top.equalTo(self.characterInage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    private func setupContentView() {
        self.contentViewLikeButton.backgroundColor = AppColors.lightGrey
        self.contentViewLikeButton.layer.cornerRadius = 16
        self.contentView.addSubview(self.contentViewLikeButton)
        self.contentViewLikeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(71)
            make.bottom.equalToSuperview()
        }
    }
}
