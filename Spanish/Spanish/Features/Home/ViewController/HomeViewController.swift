//
//  HomeViewController.swift
//  Spanish
//
//  Created by m.marques.goncalves on 28/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	// MARK: - properties
	
	private var coordinator: AppCoordinatorDelegate
	private let words: [Word]

	// MARK: - init
	init(words: [Word], coordinator: AppCoordinatorDelegate) {
		self.words = words
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red

		print(self.words.first)
	}
}
