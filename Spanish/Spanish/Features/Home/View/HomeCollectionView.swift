//
//  HomeCollectionView.swift
//  Spanish
//
//  Created by m.marques.goncalves on 30/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

class HomeCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

	private var words: [Word]?

	private let flowLayout: UICollectionViewFlowLayout = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.minimumLineSpacing = 10
		return flowLayout
	}()

	init() {
		super.init(frame: .zero, collectionViewLayout: self.flowLayout)
		self.dataSource = self
		self.delegate = self

		self.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return words?.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell

		guard let word = words?[indexPath.row] else {
			fatalError("Word could not be nil")
		}

		cell.configure(withWord: word)
		return cell
	}

	func updateCollectionView(with words: [Word]) {
		self.words = words
		reloadData()
	}
}
