//
//  RestaurantDetailViewModel.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

struct RestaurantDetailViewModel {
	let restaurantViewModel: RestaurantViewModel
	let likeCount: String
	let restaurantStatModel: RestaurantStatViewModel

	init(restaurantDetail: RestaurantDetail) {
		self.restaurantViewModel = RestaurantViewModel(restaurant: restaurantDetail.restaurant)
		self.restaurantStatModel = RestaurantStatViewModel(stats: restaurantDetail.stats)
		self.likeCount = "LikeCount = \(restaurantDetail.likeCount)"
	}
}

