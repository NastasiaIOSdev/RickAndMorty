//
//  EpisodesHeaderView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//
import UIKit
import SnapKit

final class EpisodesHeaderView: UIView {
    // MARK: - Property
    private let contentView = UIView()
    private let logoImage = UIImageView()
    private let searchBarView = SearchBarView()
    private let advancedFilter = AdvancedFilterView()
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - SetupUI
private extension EpisodesHeaderView {
    private func setupUI() {
        backgroundColor = .clear
        addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        self.setupLogoImage()
        self.setupSearhBar()
        self.setupAdvancedFilter()
    }
    private func setupLogoImage() {
        self.logoImage.contentMode = .scaleAspectFit
        self.logoImage.image = UIImage(named: "Logo")
        self.contentView.addSubview(self.logoImage)
        self.logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(57)
            make.leading.trailing.equalToSuperview().inset(22)
        }
    }
    private func setupSearhBar() {
        self.contentView.addSubview(self.searchBarView)
        self.searchBarView.snp.makeConstraints { make in
            make.top.equalTo(self.logoImage.snp.bottom).offset(67)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
    }
    private func setupAdvancedFilter() {
        self.contentView.addSubview(self.advancedFilter)
        self.advancedFilter.snp.makeConstraints { make in
            make.top.equalTo(self.searchBarView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
    }
}
