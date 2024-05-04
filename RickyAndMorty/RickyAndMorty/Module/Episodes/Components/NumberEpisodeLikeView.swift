//
//  NumberEpisodeLikeView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SwiftUI

final class NumberEpisodeLikeView: UIView {
    // MARK: - Property
    private let contentView = UIView()
    private let image = UIImageView()
    private let type = UILabel()
    private let delimiter = UILabel()
    private let episode = UILabel()
    private let likeImageBtn = LikeButtonViiew()
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
private extension NumberEpisodeLikeView {
    private func setupUI() {
        self.setupContentView()
        self.setupContentViewStaff()
    }
    private func setupContentView() {
        self.contentView.backgroundColor = AppColors.lightGrey
        self.contentView.layer.cornerRadius = 16
        addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(71)
            make.bottom.equalToSuperview()
        }
    }
    private func setupContentViewStaff() {
        self.image.image = UIImage(named: "playscreen")
        self.image.contentMode = .scaleAspectFit
        self.contentView.addSubview(self.image)
        self.image.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(22)
            make.height.width.equalTo(26)
        }
        self.type.text = "Pilot"
        self.type.font = AppFonts.regular16.font
        self.contentView.addSubview(self.type)
        self.type.snp.makeConstraints { make in
            make.leading.equalTo(self.image.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
        self.delimiter.text = "|"
        self.delimiter.font = AppFonts.regular16.font
        self.contentView.addSubview(self.delimiter)
        self.delimiter.snp.makeConstraints { make in
            make.leading.equalTo(self.type.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
        }
        self.episode.text = "S01E01"
        self.episode.font = AppFonts.regular16.font
        self.contentView.addSubview(self.episode)
        self.episode.snp.makeConstraints { make in
            make.leading.equalTo(self.delimiter.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
        }
        self.contentView.addSubview(self.likeImageBtn)
        self.likeImageBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22)
            make.height.equalTo(30)
        }
    }
}
