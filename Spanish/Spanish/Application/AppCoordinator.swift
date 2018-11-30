//
//  AppCoordinator.swift
//  Spanish
//
//  Created by m.marques.goncalves on 28/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

// MARK: - coordinator protocol
protocol Coordinator: class {
	var rootViewController: UIViewController? { get }
	func start(with completion: @escaping () -> Void)
}

protocol AppCoordinatorDelegate {
	func selectedSentence(_ word: Word)
}

class AppCoordinator: Coordinator {

	// MARK: - properties

	var rootViewController: UIViewController?
	private let window: UIWindow

	// MARK: - init

	init(window: UIWindow) {
		self.window = window
	}

	func start(with completion: @escaping () -> Void = {}) {
		let homeCoordinator = HomeCoordinator(delegate: self)
		homeCoordinator.start()
		guard let homeViewController = homeCoordinator.rootViewController else {
			fatalError("Can't instanciate HomeViewController")
		}

		self.rootViewController = homeViewController
		self.window.rootViewController = self.rootViewController
	}
}

// MARK: - delegate

extension AppCoordinator: AppCoordinatorDelegate {
	func selectedSentence(_ word: Word) { }
}
