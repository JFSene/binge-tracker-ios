//
//  SignupViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift

class SignupViewController: UIViewController {
	//MARK: Variables & Outlets
	@IBOutlet weak var nameLabelOUTLET: UILabel!
	@IBOutlet weak var nameTextFieldOUTLET: UITextField!
	@IBOutlet weak var emailLabelOUTLET: UILabel!
	@IBOutlet weak var emailTextFieldOUTLET: UITextField!
	@IBOutlet weak var passwordLabelOUTLET: UILabel!
	@IBOutlet weak var passwordTextFieldOUTLET: UITextField!
	@IBOutlet weak var repeatPasswordLabelOUTLET: UILabel!
	@IBOutlet weak var doneButtonOUTLET: BRButton!
	@IBOutlet weak var repeatPasswordTextFieldOUTLET: UITextField!
	let realm = try! Realm()
	var user = RealmUser()



	override func viewDidLoad() {
		super.viewDidLoad()
		prepareNavBar()
		deleteRealm()
		self.hideKeyboard()

	}


	@IBAction func doneButtonACTION(_ sender: Any) {
		validateTextFields()

		navigationController?.popViewController(animated: true)
	}




}
//MARK: Prepare Functions
extension SignupViewController {
	func validateTextFields() {
		let password = passwordTextFieldOUTLET.text
		let repeatPassword = repeatPasswordTextFieldOUTLET.text
		let name = nameTextFieldOUTLET.text
		let email = emailTextFieldOUTLET.text
		let validEmail = Util.validarEmail(email: email!)

		if (name?.characters.count)! < 4 {
			Util.alertMessageSuccess(successMessage: "Name must have at least 4 characters", controller: self, title: "Validation")
		}

		if validEmail {
			print("email is Valid")
		} else {
			Util.alertMessageSuccess(successMessage: "Email is invalid", controller: self, title: "Validation")
		}

		if (password?.characters.count)! < 6 || (repeatPassword?.characters.count)! < 6 {
			Util.alertMessageSuccess(successMessage: "Password must have at least 6 characters", controller: self, title: "Validation")
		}

		if password != repeatPassword {
			Util.alertMessageSuccess(successMessage: "Passwords do not match", controller: self, title: "Validation")
		} else {

			user.name = name
			user.email = email
			user.password = password
			saveRealm()
		}

	}

	func saveRealm() {
		try! realm.write {
			realm.add(user)
		}
	}

	func deleteRealm() {
		try! realm.write {
			realm.deleteAll()
		}
	}

	func prepareNavBar() {
		navigationItem.title = "Create your Account"
	}
}

