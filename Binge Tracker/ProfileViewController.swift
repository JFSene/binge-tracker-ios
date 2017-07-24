//
//  ProfileViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {
	//MARK: Variables & OUTLETS
	@IBOutlet weak var nameLabelOUTLET: UILabel!
	@IBOutlet weak var nameTextFieldOUTLET: UITextField!
	@IBOutlet weak var emailLabelOUTLET: UILabel!
	@IBOutlet weak var emailTextFieldOUTLET: UITextField!
	@IBOutlet weak var passwordLabelOUTLET: UILabel!
	@IBOutlet weak var passwordTextFieldOUTLET: UITextField!
	@IBOutlet weak var fsLabelOUTLET: UILabel!
	@IBOutlet weak var fsTextViewOUTLET: UITextView!
	@IBOutlet weak var editProfileButtonOUTLET: BRButton!
	@IBOutlet weak var logoutButtonOUTLET: BRButton!
	@IBOutlet weak var versionLabelOUTLET: UILabel!
	@IBOutlet weak var saveChangesButtonOUTLET: BRButton!

	@IBOutlet weak var scrollView: UIScrollView!
	let realm = try! Realm()
	let user = RealmUser()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		prepareNavBar()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		prepareTextFields()


	}

	@IBAction func editProfileACTION(_ sender: Any) {
		nameTextFieldOUTLET.isEnabled = true
		nameTextFieldOUTLET.isUserInteractionEnabled = true
		emailTextFieldOUTLET.isEnabled = true
		emailTextFieldOUTLET.isUserInteractionEnabled = true
		passwordTextFieldOUTLET.isEnabled = true
		passwordTextFieldOUTLET.isUserInteractionEnabled = true
		fsTextViewOUTLET.isUserInteractionEnabled = true
		fsTextViewOUTLET.isEditable = true
		fsTextViewOUTLET.isSelectable = true
		editProfileButtonOUTLET.isHidden = true
		saveChangesButtonOUTLET.isHidden = false

	}

	@IBAction func saveChangesButtonACTION(_ sender: Any) {
		nameTextFieldOUTLET.isEnabled = false
		nameTextFieldOUTLET.isUserInteractionEnabled = false
		emailTextFieldOUTLET.isEnabled = false
		emailTextFieldOUTLET.isUserInteractionEnabled = false
		passwordTextFieldOUTLET.isEnabled = false
		passwordTextFieldOUTLET.isUserInteractionEnabled = false
		fsTextViewOUTLET.isUserInteractionEnabled = false
		fsTextViewOUTLET.isEditable = false
		fsTextViewOUTLET.isSelectable = false
		editProfileButtonOUTLET.isHidden = false
		saveChangesButtonOUTLET.isHidden = true
		validateTextFields()
	}

	@IBAction func logoutButtonACTION(_ sender: Any) {
		deleteRealm()
		Util.navController(self)
		print("here")
	}

}

//MARK: Prepare Functions
extension ProfileViewController {
	func prepareTextFields() {
		let usuario = realm.object(ofType: RealmUser.self, forPrimaryKey: 0)

		nameTextFieldOUTLET.text = usuario?.name
		emailTextFieldOUTLET.text = usuario?.email
		passwordTextFieldOUTLET.text  = usuario?.password
		fsTextViewOUTLET.text = usuario?.favseries
		fsTextViewOUTLET.layer.borderWidth = 2
		fsTextViewOUTLET.layer.borderColor = Util.ruivo.cgColor
		fsTextViewOUTLET.layer.cornerRadius = 10

		let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
		versionLabelOUTLET.text = "V\(version)"
	}


	func validateTextFields() {
		let password = passwordTextFieldOUTLET.text
		let name = nameTextFieldOUTLET.text
		let email = emailTextFieldOUTLET.text
		let validEmail = Util.validarEmail(email: email!)
		let favSeries = fsTextViewOUTLET.text


		if (name?.characters.count)! < 4 {
			Util.alertMessageSuccess(successMessage: "Name must have at least 4 characters", controller: self, title: "Validation")
		}

		if validEmail {
			print("email is Valid")
		} else {
			Util.alertMessageSuccess(successMessage: "Email is invalid", controller: self, title: "Validation")
		}

		if (password?.characters.count)! < 6  {
			Util.alertMessageSuccess(successMessage: "Password must have at least 6 characters", controller: self, title: "Validation")
		}

		user.name = name
		user.email = email
		user.password = password
		user.favseries = favSeries

		try! realm.write {
			realm.add(user, update: true)
		}

	}


	func deleteRealm() {
		try! realm.write {
			realm.deleteAll()
		}
	}
	func prepareNavBar() {
		self.tabBarController?.navigationItem.title = "Profile"
	}
}
