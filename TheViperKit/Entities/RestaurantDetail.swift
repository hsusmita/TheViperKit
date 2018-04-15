//
//  RestaurantDetail.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

struct RestaurantDetail: Codable {
	let restaurant: Restaurant
	let stats: RestaurantStats
	var likeCount: Int
}

extension RestaurantDetail {
	enum CodingKeys: String, CodingKey {
		case venue
		case likes
	}

	enum VenueKeys: String, CodingKey {
		case stats
	}

	enum LikeKeys: String, CodingKey {
		case count
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		restaurant = try container.decode(Restaurant.self, forKey: .venue)
		let venueContainer = try container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
		stats = try venueContainer.decode(RestaurantStats.self, forKey: .stats)
		let likesContainer = try container.nestedContainer(keyedBy: LikeKeys.self, forKey: .likes)
		likeCount = try likesContainer.decode(Int.self, forKey: .count)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(restaurant, forKey: .venue)
		var likesContainer = container.nestedContainer(keyedBy: LikeKeys.self, forKey: .likes)
		try likesContainer.encode(likeCount, forKey: .count)
		var venueContainer = container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
		try venueContainer.encode(stats, forKey: .stats)
	}
}
