//
//  RestaurantStatViewModel.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

struct RestaurantStatViewModel {
	let checkinsCount: String
	let usersCount: String
	let tipCount: String
	let visitsCount: String

	init(checkinsCount: String, usersCount: String, tipCount: String, visitsCount: String) {
		self.checkinsCount = checkinsCount
		self.usersCount = usersCount
		self.tipCount = tipCount
		self.visitsCount = visitsCount
	}

	init(stats: RestaurantStats) {
		self.init(
			checkinsCount: "Checkins: \(stats.checkinsCount)",
			usersCount: "User count: \(stats.usersCount)",
			tipCount: "Tip count: \(stats.tipCount)",
			visitsCount: "Visits count: \(stats.visitsCount)"
		)
	}
}
