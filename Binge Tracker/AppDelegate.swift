//
//  AppDelegate.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var tabBarController: UITabBarController?
	let vermelhoBase = UIColor(red: 216/256, green: 58/256, blue: 36/256, alpha: 1)


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
		IQKeyboardManager.sharedManager().enable = true
		TraktManager.sharedManager.setClientID(clientID: "66c0a23fedc0105d7aea70feb2905d759bb5c7392f22dbc9b0d2ffd2c0aff9d7", clientSecret: "27deaa8f821c708bf2f0096d88855b27a05a54693970eff688778f642bd1e76a", redirectURI: "urn:ietf:wg:oauth:2.0:oob")


		let mainController = InitialViewController() as UIViewController
		//Tabs
		let watchTab = WatchListViewController(nibName: "WatchListViewController", bundle: nil)
		watchTab.tabBarItem.title = "Watch List"
		watchTab.tabBarItem.image = UIImage(named: "ic_tv_white")

		let searchTab = SearchViewController(nibName: "SearchViewController", bundle: nil)
		searchTab.tabBarItem.title = "Search"
		searchTab.tabBarItem.image = UIImage(named: "ic_search_white")

		let profileTab = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		profileTab.tabBarItem.title = "Profile"
		profileTab.tabBarItem.image = UIImage(named: "ic_profile")

		UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray], for:.normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red], for:.selected)
		self.tabBarController = UITabBarController()
		self.tabBarController!.setViewControllers([watchTab, searchTab, profileTab], animated: false);

		let navigationController = UINavigationController(rootViewController: mainController)
		navigationController.navigationBar.isTranslucent = false

		//NavigationBar Appearance settings
		let navigationBarAppearance = UINavigationBar.appearance()
		navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
		navigationBarAppearance.tintColor = .white
		navigationBarAppearance.barTintColor = vermelhoBase
		UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -80.0), for: .default)
		
		//REALM Object
		let realm = try! Realm()
		let loggedUser = realm.object(ofType: RealmUser.self, forPrimaryKey: 0)
		print(loggedUser)

		if loggedUser == nil {
			self.window?.rootViewController = navigationController
		} else {
			let loginViewController = UINavigationController(rootViewController: tabBarController!)
			self.window?.rootViewController = loginViewController
		}


		self.window?.makeKeyAndVisible()

		return true
	}



}

