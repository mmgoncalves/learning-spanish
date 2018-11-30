//
//  File.swift
//  Spanish
//
//  Created by m.marques.goncalves on 03/09/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class HomeView: UIView {

	private (set) lazy var collectionView: HomeCollectionView = {
		let collection = HomeCollectionView()
		collection.translatesAutoresizingMaskIntoConstraints = false
		return collection
	}()

	init() {
		super.init(frame: .zero)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
}

extension HomeView: ViewCode {

	func configure() {
		backgroundColor = .white
	}

	func buildHierarchy() {
		addSubview(collectionView)
	}

	func buildConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
			])
	}
}
