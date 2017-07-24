//
//  InitialViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

	//MARK: Variables & Outlets

	@IBOutlet weak var titleImgOUTLET: UIImageView!
	@IBOutlet weak var loginButtonOUTLET: BRButton!
	@IBOutlet weak var signupButtonOUTLET: BRButton!


	override func viewDidLoad() {
		super.viewDidLoad()
		prepareButtons()
		prepareNavBar()

		
	}

	@IBAction func loginButtonACTION(_ sender: Any) {
		print("Login")
		navigationController?.pushViewController(LoginViewController(), animated: true)
	}


	@IBAction func signupButtonACTION(_ sender: Any) {
		print("Singup")
		navigationController?.pushViewController(SignupViewController(), animated: true)
	}

}

//MARK: Prepare Functions
extension InitialViewController {
	func prepareButtons() {

		loginButtonOUTLET.setTitle("Login", for: .normal)
		loginButtonOUTLET.setTitleColor(.white, for: .normal)
		signupButtonOUTLET.setTitle("Sign up", for: .normal)
	}

	func prepareNavBar() {
		navigationItem.title = "Binge Tracker"
	}
}
