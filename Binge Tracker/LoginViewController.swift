//
//  LoginViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
	//MARK: Variables & OUTLETS
	@IBOutlet weak var titleImgOUTLET: UIImageView!
	@IBOutlet fileprivate weak var emailTextField: UITextField!
	@IBOutlet fileprivate weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButtonOUTLET: BRButton!
	let realm = try! Realm()


	override func viewDidLoad() {
		super.viewDidLoad()
		prepareNavBar()
		prepareTextFields()
		self.hideKeyboard()


	}

	@IBAction fileprivate func signInButtonTapped(_ sender: UIButton) {
		validateTextFields()
		Util.tabController(self)
	}


}

//MARK: Prepare Functions
extension LoginViewController {
	func prepareTextFields() {
		let loggedUser = realm.object(ofType: RealmUser.self, forPrimaryKey: 0)
		print(loggedUser)

		emailTextField.text = loggedUser?.email
		passwordTextField.text = loggedUser?.password
	}

	func validateTextFields() {
		let password = passwordTextField.text
		let email = emailTextField.text
		let validEmail = Util.validarEmail(email: email!)
		if validEmail {
			print("email is Valid")
		} else {
			Util.alertMessageSuccess(successMessage: "Email is invalid", controller: self, title: "Validation")
		}

		if (password?.characters.count)! < 6  {
			Util.alertMessageSuccess(successMessage: "Password must have at least 6 characters", controller: self, title: "Validation")
		}
	}

	func prepareNavBar() {
		navigationItem.title = "Login"
	}
}
