//
//  LoadingView.swift
//  Spanish
//
//  Created by m.marques.goncalves on 01/09/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class LoadingView: UIView {

	// MARK: Properties

	private lazy var loading: UIActivityIndicatorView = {
		let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.startAnimating()
		return activityIndicator
	}()
	// MARK: init

	init() {
		super.init(frame: .zero)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
}

extension LoadingView: ViewCode {
	func configure() {
		backgroundColor = .white
	}
	func buildHierarchy() {
		addSubview(loading)
	}

	func buildConstraints() {
		NSLayoutConstraint.activate([
			loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			loading.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			loading.heightAnchor.constraint(equalToConstant: 30),
			loading.widthAnchor.constraint(equalToConstant: 30)
			])
	}
}
