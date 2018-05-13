//
//  RestuarantListProtocols.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

enum RestaurantListPresenterCommand: PresenterCommand {
    case reload(list: [RestaurantViewModel])
    case showError(title: String, message: String)
}

enum RestaurantListViewEvent: ViewEvent {
    case viewDidLoad
    case didSelect(viewModel: RestaurantViewModel)
}

enum RestaurantListInteractorRequest: InteractorRequest {
    case fetchNearbyRestaurants
}

enum RestaurantListInteractorResponse: InteractorResponse {
    case restaurantsReceived(result: ServiceResult<[Restaurant]>)
}
