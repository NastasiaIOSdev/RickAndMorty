//
//  CollectionViewCell.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SnapKit
import SDWebImage

final class CollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = String(describing: CollectionViewCell.self)
    private let contentViewBackground = UIView()
    private let characterImage = UIImageView()
    private let characterName = UILabel()
    private let contentViewLikeButton = NumberEpisodeLikeView()
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.characterName.text = nil
    }
    // MARK: - Configure
//        func configure(with product: CharactersDTO) {
//            self.characterName.text = product.name
//            if let imageURLString = product.image, let imageURL = product.first.map(URL.init(string:)) {
//                self.characterImage.sd_setImage(
//                    with: imageURL,
//                    placeholderImage: UIImage(named: "noPhoto"),
//                    completed: { (image, error, cacheType, imageURL) in
//                    if let error = error {
//                        print("Failed to load image with error: \(error.localizedDescription)")
//                    }
//                })
//            }
//            else {
//                self.characterImage.image = UIImage(named: "noPhoto")
//            }
    //    }

    // MARK: - UI Setup
    private func setupUI() {
        contentViewBackground.layer.cornerRadius = 4
        contentViewBackground.backgroundColor = .white
        contentViewBackground.applyShadow(color: .black, alpha: 0.24, x: 0, y: 2, blur: 2, spread: 0)
        contentView.addSubview(contentViewBackground)
        contentViewBackground.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(360)
        }
        self.configureCharacterImage()
        self.setupCharacterNameLabel()
        self.setupContentViewLikeButton()
    }
    private func configureCharacterImage() {
        characterImage.image = UIImage(named: "media")
        characterImage.contentMode = .scaleAspectFill
        contentViewBackground.addSubview(characterImage)
        characterImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(232)
        }
    }
    private func setupCharacterNameLabel() {
        characterName.text = "Rick Sanchez"
        characterName.font = AppFonts.medium20.font
        contentViewBackground.addSubview(characterName)
        characterName.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    private func setupContentViewLikeButton() {
        contentViewLikeButton.backgroundColor = AppColors.lightGrey
        contentViewLikeButton.layer.cornerRadius = 16
        contentViewBackground.addSubview(contentViewLikeButton)
        contentViewLikeButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(71)
        }
    }
}
