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
	var rootViewController: UIViewController? { get set }
	func start(with completion: @escaping () -> Void)
}

protocol AppCoordinatorDelegate {
	func selectedSentence(_ word: Word)
}

class AppCoordinator: Coordinator {

	// MARK: - properties

	var rootViewController: UIViewController?
	private let window: UIWindow
	private var words: [Word]?

	// MARK: - init

	init(window: UIWindow) {
		self.window = window
		fetchWords()
	}

	func start(with completion: @escaping () -> Void = {}) {
		let homeCoordinator = HomeCoordinator(words: self.words, delegate: self)
		homeCoordinator.start()
		guard let homeViewController = homeCoordinator.rootViewController else {
			fatalError()
		}

		self.rootViewController = homeViewController
		self.window.rootViewController = self.rootViewController
	}

	private func fetchWords() {
		let bundle: Bundle = Bundle(for: AppCoordinator.self)
		guard let jsonPath = bundle.path(forResource: "words", ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath), options: .mappedIfSafe) else {
				fatalError("Parse json correctly")
		}

		do {
			let words = try JSONDecoder().decode([Word].self, from: jsonData)
			self.words = words
		} catch {
			print(error.localizedDescription)
		}
	}
}

// MARK: - delegate

extension AppCoordinator: AppCoordinatorDelegate {
	func selectedSentence(_ word: Word) { }
}
