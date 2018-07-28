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
		let homeViewController = HomeViewController(coordinator: self.delegate)
		self.rootViewController = homeViewController
	}
}
