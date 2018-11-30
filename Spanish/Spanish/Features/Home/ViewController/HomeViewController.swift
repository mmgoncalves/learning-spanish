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

	private lazy var homeView: HomeView = {
		let view = HomeView()
//		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var loadingView: LoadingView = {
		let view = LoadingView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let loadingViewController = LoadingViewController()
	private var coordinator: AppCoordinatorDelegate
	private var words: [Word]?

	// MARK: - init
	init(words: [Word]?, coordinator: AppCoordinatorDelegate) {
		self.words = words
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		super.loadView()
		view = UIView()
	}

	override func viewDidAppear(_ animated: Bool) {
//		super.viewDidAppear(animated)

	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(homeView)
		if words == nil {
			view.addSubview(loadingView)
		}
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		if words == nil {
//			present(loadingViewController, animated: true, completion: nil)
//			view.addSubview(loadingView)
			fetchWords()
		}
	}

	private func fetchWords() {
		let words = WordRepository.fetchAll()
		self.words = words
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
//			self.setupCollectionView()
//			self.loadingView.removeFromSuperview()
//			self.loadingView.dismiss(animated: true, completion: nil)
		}
	}
	private func setupCollectionView() {
		if let words = words {
			homeView.collectionView.updateCollectionView(with: words)
		}
	}
}
