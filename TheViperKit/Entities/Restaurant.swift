//
//  Restaurant.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

struct Restaurant: Codable  {
	let id: String
	let name: String
	let location: Location
	let rating: Double?
	let price: Int
	let verified: Bool
}

extension Restaurant {

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case location
		case rating
		case price
		case verified
	}

	enum PriceKey: String, CodingKey {
		case tier
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(String.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		location = try container.decode(Location.self, forKey: .location)
		verified = try container.decode(Bool.self, forKey: .verified)
		let nestedContainer = try container.nestedContainer(keyedBy: PriceKey.self, forKey: .price)
		price = try nestedContainer.decode(Int.self, forKey: .tier)
		rating = try container.decodeIfPresent(Double.self, forKey: .rating)
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		try container.encode(location, forKey: .location)
		try container.encode(verified, forKey: .verified)
		try container.encode(rating, forKey: .rating)
		var nestedContainer = container.nestedContainer(keyedBy: PriceKey.self, forKey: .price)
		try nestedContainer.encode(price, forKey: .tier)
	}
}
