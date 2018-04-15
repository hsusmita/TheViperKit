//
//  RestaurantListInteractor.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantListInteractor: RestaurantListInteractorInputProtocol {
   weak var presenter: RestaurantListInteractorOutputProtocol?
    private let baseApiClient: BaseAPIClient
    
    init(baseApiClient: BaseAPIClient) {
        self.baseApiClient = baseApiClient
    }
    
    func fetchNearbyRestaurants() {
        let resource = Resource<SuggestedRestaurants>(requestRouter: RequestRouter.fetchList)
        baseApiClient.request(resource) { [weak presenter] result in
            switch result {
            case .success(let suggestedRestaurants):
                presenter?.restaurantsReceived(result: ServiceResult.success(suggestedRestaurants.list))

            case .failure(let error):
                presenter?.restaurantsReceived(result: ServiceResult.failure(error))
            }
        }
    }
}
