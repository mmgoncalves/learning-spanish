//
//  TabBarController.swift
//  Spanish
//
//  Created by m.marques.goncalves on 28/07/18.
//  Copyright © 2018 learning-spanish. All rights reserved.
//

import UIKit

fileprivate enum TabBarItem: Int{
	case home

	var title: String {
		switch self {
		case .home:
			return "Home"
		}
	}
}

class TabBarController: UITabBarController {

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.tintColor = UIColor.white
		tabBar.isTranslucent = false
		tabBar.barTintColor = UIColor.lightGray
	}

	func setupTabBar() {
		guard let viewControllers = self.viewControllers else {
			return
		}

		for (index, viewController) in viewControllers.enumerated() {
			let item = TabBarItem(rawValue: index)
			viewController.tabBarItem.title = item?.title
			viewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
			viewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
	}
}
