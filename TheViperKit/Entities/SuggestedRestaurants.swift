//
//  SuggestedRestaurants.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

struct SuggestedRestaurants: Codable {
	let list: [Restaurant]

	enum CodingKeys: String, CodingKey {
		case groups
	}
	enum ItemKeys: String, CodingKey {
		case items
	}
	enum VenueKeys: String, CodingKey {
		case venue
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var groupsContainer = container.nestedUnkeyedContainer(forKey: .groups)
		var itemContainer = groupsContainer.nestedContainer(keyedBy: ItemKeys.self)
		var listContainer = itemContainer.nestedUnkeyedContainer(forKey: SuggestedRestaurants.ItemKeys.items)
		for index in 0..<list.count {
			var venueContainer = listContainer.nestedContainer(keyedBy: VenueKeys.self)
			try venueContainer.encode(list[index], forKey: .venue)
		}
	}
}

extension SuggestedRestaurants {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var groupsContainer = try container.nestedUnkeyedContainer(forKey: .groups)
        var restaurants: [Restaurant] = []
        while !groupsContainer.isAtEnd {
            let itemContainer = try groupsContainer.nestedContainer(keyedBy: ItemKeys.self)
            var listContainer = try itemContainer.nestedUnkeyedContainer(forKey: SuggestedRestaurants.ItemKeys.items)
            while !listContainer.isAtEnd {
                let venueContainer = try listContainer.nestedContainer(keyedBy: VenueKeys.self)
                let restaurant = try venueContainer.decode(Restaurant.self, forKey: .venue)
                restaurants.append(restaurant)
            }
        }
        list = restaurants
    }
}
