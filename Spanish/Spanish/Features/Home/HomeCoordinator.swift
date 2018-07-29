//
//  HomeCoordinator.swift
//  Spanish
//
//  Created by m.marques.goncalves on 28/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
	var rootViewController: UIViewController?
	private let delegate: AppCoordinatorDelegate

	init(delegate: AppCoordinatorDelegate) {
		self.delegate = delegate
	}

	func start(with completion: @escaping () -> Void = {}) {
		let tabBar = TabBarController()
		let homeViewController = HomeViewController(coordinator: self.delegate)
		if tabBar.viewControllers != nil {
			tabBar.viewControllers?.append(homeViewController)
		} else {
			tabBar.viewControllers = [homeViewController]
		}

		self.rootViewController = tabBar
		tabBar.setupTabBar()
	}
}
