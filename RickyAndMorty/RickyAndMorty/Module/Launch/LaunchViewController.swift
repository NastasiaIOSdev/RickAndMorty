//
//  LaunchViewController.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
import SnapKit

final class LaunchViewController: UIViewController {
    enum Event {
        case launchComplete
    }
    var didSendEventHandler: ((LaunchViewController.Event) -> Void)?
    private var LaunchEventType: Event = .launchComplete
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: ImageName.launchImageFirst)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var loaderImage: UIImageView = {
        let image = UIImage(named: ImageName.launchImageSecond)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var animator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 3, curve: .easeInOut)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemBackground
        self.setupUI()
        self.showLaunchToEpisodeFlowAnimation()
    }
}
// MARK: - SetupUI
private extension LaunchViewController {
    private func setupUI() {
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                  let guide = view.safeAreaLayoutGuide
                  make.top.equalTo(guide).offset(17)
                  make.leading.trailing.equalTo(guide).inset(17)
              } else {
                  make.top.equalToSuperview().offset(17)
                  make.leading.trailing.equalToSuperview().inset(17)
              }
        }
        view.addSubview(loaderImage)
        loaderImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
}
// MARK: - Animation
private extension LaunchViewController {
    private func showLaunchToEpisodeFlowAnimation() {
        animator.addAnimations {
            self.loaderImage.transform = CGAffineTransform(rotationAngle: .pi)
        }
        animator.addCompletion { position in
            switch position {
            case .end: self.didSendEventHandler?(.launchComplete)
            case .start, .current: break
            @unknown default: break
            }
        }
        animator.startAnimation(afterDelay: 0.0)
    }
}
