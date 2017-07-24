//
//  Serie.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import ObjectMapper

struct Serie {
	var name: String?
	var porcentagem: String?
	var nextEP: String?
	var sinopse: String?
}

extension Serie: Mappable {
	init?(map: Map) {
	}
 mutating func mapping(map: Map) {
	name <- map["name"]
	porcentagem <- map["porcentagem"]
	nextEP <- map["nextEP"]
	sinopse <- map["sinopse"]
 }
}

