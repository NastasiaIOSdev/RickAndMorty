//
//  LaunchCoordinator.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit
protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
    func startFirstLaunch()
}
final class LaunchCoordinator: LaunchCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    func start() {
        showLaunchViewController(isShowOnboardingBefore: true)
    }
    func startFirstLaunch() {
        showLaunchViewController()
    }
    func showLaunchViewController(isShowOnboardingBefore: Bool = false) {
        let launchViewController = LaunchAssembly.configure(dependencies)
        if let launchViewController = launchViewController as? LaunchViewController {
            launchViewController.didSendEventHandler = { [weak self] event in
                switch event {
                case .launchComplete:
                    self?.finish()
                }
            }
        }
        navigationController.show(launchViewController, sender: self)
    }
}
