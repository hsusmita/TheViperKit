//
//  RestaurantDetailInteractor.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 16/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantDetailInteractor: Interactor {
	typealias Request = RestaurantDetailInteractorRequest
	typealias Response = RestaurantDetailInteractorResponse
	
	weak var responseListener: AnyResponseListener<RestaurantDetailInteractorResponse>?

    private let baseApiClient: BaseAPIClient

    init(baseApiClient: BaseAPIClient) {
        self.baseApiClient = baseApiClient
    }
	
	func handle(request: RestaurantDetailInteractorRequest) {
		switch request {
		case .fetchRestaurantDetail(let id):
			self.fetchRestaurantDetail(id: id)
		}
	}
	
    private func fetchRestaurantDetail(id: String) {
        let resource = Resource<RestaurantDetail>(requestRouter: RequestRouter.fetchDetail(id: id))
        baseApiClient.request(resource) { [weak responseListener] result in
            responseListener?.handle(response: .restaurantDetailReceived(result: result))
        }
    }
}
