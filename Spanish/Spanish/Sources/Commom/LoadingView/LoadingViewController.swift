//
//  LoadingViewController.swift
//  Spanish
//
//  Created by m.marques.goncalves on 01/09/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

	// MARK: properties

	private (set) lazy var loadingView: LoadingView = {
		let view = LoadingView()
		return view
	}()

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
		print("Fui alocada")
	}

	deinit {
		print("fui desalocada")
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: View life cycle

	override func loadView() {
		super.loadView()
		view = loadingView
	}
}
