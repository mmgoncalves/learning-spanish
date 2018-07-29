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
	private let words: [Word]?

	init(words: [Word]? = nil, delegate: AppCoordinatorDelegate) {
		self.words = words
		self.delegate = delegate
	}

	func start(with completion: @escaping () -> Void = {}) {
		// TODO: - if words dosn't exist, show empty state view
		let tabBar = TabBarController()
		let homeViewController = HomeViewController(words: self.words!, coordinator: self.delegate)
		if tabBar.viewControllers != nil {
			tabBar.viewControllers?.append(homeViewController)
		} else {
			tabBar.viewControllers = [homeViewController]
		}

		self.rootViewController = tabBar
		tabBar.setupTabBar()
	}
}
