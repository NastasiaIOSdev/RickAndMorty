//
//  LikeButtonViiew.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 04.05.2024.
//
import UIKit
import SnapKit

final class LikeButtonViiew: UIButton {
    // MARK: - Property
    private let likeImage = UIImageView()
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
private extension LikeButtonViiew {
    private func setupUI() {
        self.setImage(UIImage(named: "like"), for: .normal)
        self.setImage(UIImage(named: "likeFill"), for: .selected)
        self.contentMode = .scaleAspectFit
        addSubview(self.likeImage)
        self.likeImage.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        self.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
}
// MARK: - Action & Animation
private extension LikeButtonViiew {
    @objc
    private func buttonTapped() {
        self.isSelected = !self.isSelected
        self.buttonanimation()
    }
    private func buttonanimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.likeImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.likeImage.image = self.isSelected ? UIImage(named: "fillHeart") : UIImage(named: "like")
                self.likeImage.transform = .identity
            }
        }
    }
}
