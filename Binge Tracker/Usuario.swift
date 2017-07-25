//
//  Usuario.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import ObjectMapper

struct Usuario {
	var id: Int = 0
	var name: String?
	var email: String?
	var password: String?
}

extension Usuario: Mappable {
	init?(map: Map) {
	}

	mutating func mapping(map: Map) {
		id <- map["id"]
		name <- map["name"]
		email <- map["email"]
		password <- map["senha"]
	}
}
