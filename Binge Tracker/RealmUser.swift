//
//  RealmUser.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object {
	dynamic var id: Int = 0
	dynamic var name: String?
	dynamic var email: String?
	dynamic var password: String?
	dynamic var favseries: String?

	override static func primaryKey() -> String? {
		return "id"
	}
}

extension RealmUser: Adapter {
	convenience init(user: Usuario) {
		self.init()
		id = user.id
		name = user.name
		email = user.email
		password = user.password
	}

	func adapt() -> Usuario {
		return Usuario(id: id,name: name, email: email, password: password)
	}
}
