//
//  Serie.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import ObjectMapper

struct Serie {
	// Extended: Min
	var title: String?
	var year: Int?
	var ids: String?
	var overview: String?
	var firstAired: Date?
	var runtime: Int?
	var certification: String?
	var network: String?
	var country: String?
	var trailer: String?
	var homepage: String?
	var status: String?
	var rating: Double?
	var votes: Int?
	var updatedAt: Date?
	var language: String?
	var availableTranslations: String?
	var genres: String?
	var airedEpisodes: Int?
}

extension Serie: Mappable {
	init?(map: Map) {
	}
 mutating func mapping(map: Map) {

	title <- map["title"]
	year <- map["year"]
	ids <- map["ids"]
	overview <- map["overview"]
	firstAired <- map["firstAired"]
	runtime <- map["runtime"]
	certification <- map["certification"]
	network <- map["network"]
	country <- map["country"]
	trailer <- map["trailer"]
	homepage <- map["homepage"]
	status <- map["status"]
	rating <- map["rating"]
	votes <- map["votes"]
	updatedAt <- map["updatedAt"]
	language <- map["language"]
	availableTranslations <- map["availableTranslations"]
	genres <- map["genres"]
	airedEpisodes <- map["airedEpisodes"]
 }
}

