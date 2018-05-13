//
//  RestaurantDetailProtocols.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

enum RestaurantDetailViewEvent: ViewEvent {
	case viewDidLoad
}

enum RestaurantDetailPresenterCommand: PresenterCommand {
	case reload(detail: RestaurantDetailViewModel)
	case showError(title: String, message: String)
}

enum RestaurantDetailInteractorRequest: InteractorRequest {
	case fetchRestaurantDetail(id: String)
}

enum RestaurantDetailInteractorResponse: InteractorResponse {
	case restaurantDetailReceived(result: ServiceResult<RestaurantDetail>)
}
