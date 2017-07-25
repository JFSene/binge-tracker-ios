//
//  Util.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class Util {
	public static let navigationBarAppearance = UINavigationBar.appearance()
	public static let ruivo = UIColor(red: 216/256, green: 58/256, blue: 36/256, alpha: 1)
	public static var tabBarController: UITabBarController?

	public static func navController(_ view: UIViewController) {
		let rootViewController = InitialViewController()
		let navigationController = UINavigationController(rootViewController: rootViewController)
		navigationController.navigationBar.isTranslucent = false
		//NavigationBar Appearance settings

		navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
		navigationBarAppearance.tintColor = .white
		navigationBarAppearance.barTintColor = ruivo
		UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -80.0), for: .default)


		view.present(navigationController, animated: true, completion: nil)
	}

	public static func tabController(_ view: UIViewController) {
		let watchTab = WatchListViewController(nibName: "WatchListViewController", bundle: nil)
		watchTab.tabBarItem.title = "Watch List"
		watchTab.tabBarItem.image = UIImage(named: "ic_tv_white")

		let searchTab = SearchViewController(nibName: "SearchViewController", bundle: nil)
		searchTab.tabBarItem.title = "Search"
		searchTab.tabBarItem.image = UIImage(named: "ic_search_white")

		let profileTab = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		profileTab.tabBarItem.title = "Profile"
		profileTab.tabBarItem.image = UIImage(named: "ic_profile")
		tabBarController = UITabBarController()
		tabBarController!.setViewControllers([watchTab, searchTab, profileTab], animated: false);

		//NavigationBar Appearance settings
		navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
		navigationBarAppearance.tintColor = .white
		navigationBarAppearance.barTintColor = ruivo
		UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -80.0), for: .default)

		let navigationController = UINavigationController(rootViewController: tabBarController!)
		navigationController.navigationBar.isTranslucent = false


		view.present(navigationController, animated: true, completion: nil)
	}

	static func alertMessageSuccess(successMessage: String, controller: UIViewController, title: String, handler: ((UIAlertAction) -> Void)? = nil) {
		let alertController = UIAlertController(title: title, message: successMessage, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
		alertController.addAction(okAction)
		controller.present(alertController, animated: true, completion: nil)
	}

	public static func validarEmail(email: String) -> Bool {
		if email.isEmpty {
			return false
		}
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: email)
	}

	public static func stringParaData(data: String, formato: String) -> Date {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formato
		return dateFormatter.date(from: data)!
	}

	public static func dateParaString(data: Date, formato: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formato
		return dateFormatter.string(from: data)
	}

}
