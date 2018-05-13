//
//  RestaurantListInteractor.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantListInteractor: Interactor {
	typealias Response = RestaurantListInteractorResponse
	typealias Request = RestaurantListInteractorRequest
	
    private let baseApiClient: BaseAPIClient
    
    init(baseApiClient: BaseAPIClient) {
        self.baseApiClient = baseApiClient
    }
    
	var responseListener: AnyResponseListener<RestaurantListInteractorResponse>?
	
	func handle(request: RestaurantListInteractorRequest) {
		switch request {
		case .fetchNearbyRestaurants:
			self.fetchNearbyRestaurants()
		}
	}

    private func fetchNearbyRestaurants() {
        let resource = Resource<SuggestedRestaurants>(requestRouter: RequestRouter.fetchList)
        self.baseApiClient.request(resource) { [weak responseListener] result in
            switch result {
            case .success(let suggestedRestaurants):
				responseListener?.handle(response: .restaurantsReceived(result: ServiceResult.success(suggestedRestaurants.list)))

            case .failure(let error):
				responseListener?.handle(response: .restaurantsReceived(result: ServiceResult.failure(error)))
            }
        }
    }
}
