//
//  ViewCode.swift
//  Spanish
//
//  Created by m.marques.goncalves on 30/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import Foundation

protocol ViewCode: class {
	func setup()
	func buildHierarchy()
	func buildConstraints()
	func configure()
}

extension ViewCode {
	func setup() {
		buildHierarchy()
		buildConstraints()
		configure()
	}

	func configure() { }
}
