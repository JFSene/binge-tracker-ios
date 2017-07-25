//
//  RealmSeries.swift
//  Binge Tracker
//
//  Created by Joel Sene on 25/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import Foundation
import RealmSwift

class RealmSeries: Object {
	dynamic var title: String?
	dynamic var year: Int = 0
	dynamic var ids: String?
	dynamic var overview: String?
	dynamic var firstAired: Date?
	dynamic var runtime: Int = 0
	dynamic var certification: String?
	dynamic var network: String?
	dynamic var country: String?
	dynamic var trailer: String?
	dynamic var homepage: String?
	dynamic var status: String?
	dynamic var rating: Double = 0.0
	dynamic var votes: Int = 0
	dynamic var updatedAt: Date?
	dynamic var language: String?
	dynamic var availableTranslations: String?
	dynamic var genres: String?
	dynamic var airedEpisodes: Int = 0

	override static func primaryKey() -> String? {
		return "title"
	}
}

extension RealmSeries: Adapter {
	convenience init(serie: Serie) {
		self.init(serie: serie)
		title = serie.title
		year = serie.year!
		ids = serie.ids
		overview = serie.overview
		firstAired = serie.firstAired
		runtime = serie.runtime!
		certification = serie.certification
		network = serie.network
		country = serie.country
		trailer = serie.trailer
		homepage = serie.homepage
		status = serie.status
		rating = serie.rating!
		votes = serie.votes!
		updatedAt = serie.updatedAt
		language = serie.language
		availableTranslations = serie.availableTranslations
		genres = serie.genres
		airedEpisodes = serie.airedEpisodes!
	}
	func adapt() -> Serie {
		return Serie(title: title, year: year, ids: ids, overview: overview, firstAired: firstAired, runtime: runtime, certification: certification, network: network, country: country, trailer: trailer, homepage: homepage, status: status, rating: rating, votes: votes, updatedAt: updatedAt, language: language, availableTranslations: availableTranslations, genres: genres, airedEpisodes: airedEpisodes)
	}
}
