//
//  HomeCollectionViewCell.swift
//  Spanish
//
//  Created by m.marques.goncalves on 30/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
	// MARK: - properties

	private lazy var wordLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	// MARK: - init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - configuration
extension HomeCollectionViewCell: ViewCode {
	func configure() {
		self.backgroundColor = .white
	}

	func configure(withWord word: Word) {
		self.wordLabel.text = word.en
	}

	func buildHierarchy() {
		self.contentView.addSubview(wordLabel)
	}

	func buildConstraints() {
		layoutWordLabel()
	}
}

private extension HomeCollectionViewCell {
	func layoutWordLabel() {
		NSLayoutConstraint.activate([
			wordLabel.leadingAnchor.constraint(equalTo: wordLabel.superview!.leadingAnchor),
			wordLabel.topAnchor.constraint(equalTo: wordLabel.superview!.topAnchor),
			wordLabel.trailingAnchor.constraint(equalTo: wordLabel.superview!.trailingAnchor),
			wordLabel.bottomAnchor.constraint(equalTo: wordLabel.superview!.bottomAnchor)
			])
	}
}
