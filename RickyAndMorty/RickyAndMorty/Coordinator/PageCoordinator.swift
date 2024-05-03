//
//  PageCoordinator.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 03.05.2024.
//

import UIKit

protocol PageCoordinatorProtocol: Coordinator {
    func start()
}
final class PageCoordinator: PageCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .page }
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    func start() {
        showTabBar()
    }
    private func showTabBar() {
        let episodesViewController = EpisodesAssembly.configure(dependencies)
        if let episodesViewController = episodesViewController as? EpisodesViewController {
            episodesViewController.didSendEventHandler = { [weak self] event in
                self?.handleMainEvent(event)
            }
        }
        episodesViewController.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Home"), tag: 0)
        let favoritesViewController = FavoritesAssembly.configure(dependencies)
        favoritesViewController.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Heart"), tag: 1)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [episodesViewController, favoritesViewController]
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .blue
        self.navigationController.setViewControllers([tabBarController], animated: true)
    }
    private func handleMainEvent(_ event: EpisodesViewController.EventType) {
        switch event {
        case .detail:
            self.showDetailFlow()
        }
    }
// MARK: - showSettings
    private func showDetailFlow() {
        self.showCharactersDetailController()
    }
    private func showCharactersDetailController() {
        let charactersDetailViewController = CharacterDetailAssembly.configure(dependencies)
        self.navigationController.pushViewController(charactersDetailViewController, animated: true)
    }
}

