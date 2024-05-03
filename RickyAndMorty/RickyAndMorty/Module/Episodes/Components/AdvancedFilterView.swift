//
//  AdvancedFilterView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SwiftUI

final class AdvancedFilterView: UIView {
// MARK: - Property
    private let contentView = UIView()
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
// MARK: - SetupUi
private extension AdvancedFilterView {
    private func setupUI() {
        self.setupContentView()
    }
    private func setupContentView() {
        self.contentView.layer.cornerRadius = 4
        self.contentView.backgroundColor = AppColors.appBlue
        addSubview(self.contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(56)
        }
    }
}
