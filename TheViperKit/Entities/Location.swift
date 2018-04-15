//
//  Location.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 18/01/18.
//  Copyright © 2018 hsusmita. All rights reserved.
//

import Foundation

struct Location: Codable {
	let address: String?
	let crossStreet: String?
	let latitude: Double
	let longitude: Double
	let postalCode: String?
	let city: String?
	let state: String?
	let country: String?
	let formattedAddress: [String]

	enum CodingKeys: String, CodingKey {
		case address
		case crossStreet
		case latitude = "lat"
		case longitude = "lng"
		case postalCode
		case city
		case state
		case country
		case formattedAddress
	}
}
