//
//  WordRepository.swift
//  Spanish
//
//  Created by m.marques.goncalves on 01/09/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import Foundation

struct WordRepository {

	static func fetchAll() -> [Word] {
		let bundle: Bundle = Bundle(for: AppCoordinator.self)
		guard let jsonPath = bundle.path(forResource: "words", ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath), options: .mappedIfSafe) else {
				fatalError("Parse json correctly")
		}

		do {
			let words = try JSONDecoder().decode([Word].self, from: jsonData)
			return words
		} catch {
			print(error.localizedDescription)
			fatalError("Words could not be nil")
		}
	}
}
