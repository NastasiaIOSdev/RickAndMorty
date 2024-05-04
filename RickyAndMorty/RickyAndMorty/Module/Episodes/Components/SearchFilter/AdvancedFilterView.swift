//
//  AdvancedFilterView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SnapKit

final class AdvancedFilterView: UIView {
// MARK: - Property
    private let contentView2 = UIView()
    private let view = AdvancedFilterView()
    private let filterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "filter_list"))
        imageView.tintColor = .gray
        return imageView
    }()
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.text = "ADVANCED FILTERS"
        label.font = AppFonts.medium14.font
        label.textColor = AppColors.blue
        return label
    }()
// MARK: - Callbacks
    var didSelectFilter: (() -> Void)?
// MARK: - init
    init() {
        super.init(frame: .zero)
        self.setupUI()
        self.setupTapGesture()
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - SetupUi
private extension AdvancedFilterView {
    private func setupUI() {
        self.setupContentView()
        self.setupFilterImage()
        self.configureLabel()
        self.contentView2.applyShadow(color: .black, alpha: 0.24, x: 0, y: 2, blur: 2, spread: 0)
    }
    private func setupContentView() {
        self.contentView2.layer.cornerRadius = 4
        self.contentView2.backgroundColor = AppColors.appBlue
        addSubview(self.contentView2)
        contentView2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(56)
        }
    }
    private func setupFilterImage() {
        self.filterImageView.tintColor = .gray
        self.contentView2.addSubview(self.filterImageView)
        self.filterImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(20)
        }
    }
    private func configureLabel() {
        self.contentView2.addSubview(self.filterLabel)
        self.filterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    private func setupTapGesture() {
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
         contentView2.addGestureRecognizer(tapGesture)
         contentView2.isUserInteractionEnabled = true
     }
    @objc private func handleTap() {
        self.didSelectFilter?()
        print("AdvancedFilterView tapped")
    }
}
