//
//  BRKeyboard.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit

extension UIViewController {

	func hideKeyboard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(
			target: self,
			action: #selector(UIViewController.dismissKeyboard))

		view.addGestureRecognizer(tap)
	}

	func dismissKeyboard() {
		view.endEditing(true)
	}
}
