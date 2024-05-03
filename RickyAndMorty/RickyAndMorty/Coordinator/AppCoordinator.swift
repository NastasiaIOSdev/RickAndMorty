//
//  AppCoordinator.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import Foundation

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}
final class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        self.dependencies = dependencies
    }
    func start() {
        showLaunchFlow()
    }
    func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
        launchCoordinator.finishDelegate = self
        launchCoordinator.start()
        childCoordinators.append(launchCoordinator)
    }
    func showEpisodesFlow() {
        let pageCoordinator = PageCoordinator(navigationController, dependencies: dependencies)
        pageCoordinator.finishDelegate = self
        pageCoordinator.start()
        childCoordinators.append(pageCoordinator)
    }
}
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
            showEpisodesFlow()
        case .app, .page: break
        }
    }
}

