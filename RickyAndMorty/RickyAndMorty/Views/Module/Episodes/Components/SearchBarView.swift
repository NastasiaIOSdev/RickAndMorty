//
//  SearchBarView.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SnapKit

final class SearchBarView: UIView {
    // MARK: - Property
    private let contentView = UIView()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name or episode (ex. S01E01)"
        textField.borderStyle = .none
        return textField
    }()
    private let searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "loop"))
        imageView.tintColor = .gray
        return imageView
    }()
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
private extension SearchBarView {
    private func setupUI() {
        self.setupContentView()
        self.setupTextFieldImage()
        self.setupTextField()
    }
    private func setupContentView() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.backgroundColor = .white
        addSubview(self.contentView)
        self.contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(56)
        }
    }
    private func setupTextFieldImage() {
        self.contentView.addSubview(self.searchImageView)
        self.searchImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(18)
        }
    }
    private func setupTextField() {
        self.contentView.addSubview(self.textField)
        self.textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.searchImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
    }
}
