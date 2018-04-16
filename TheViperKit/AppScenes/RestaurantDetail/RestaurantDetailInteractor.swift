//
//  RestaurantDetailInteractor.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 16/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantDetailInteractor: RestaurantDetailInteractorInputProtocol {
    var presenter: RestaurantDetailInteractorOutputProtocol?
    private let baseApiClient: BaseAPIClient

    init(baseApiClient: BaseAPIClient) {
        self.baseApiClient = baseApiClient
    }
    
    func fetchRestaurantDetail(id: String) {
        let resource = Resource<RestaurantDetail>(requestRouter: RequestRouter.fetchDetail(id: id))
        baseApiClient.request(resource) { [weak presenter] result in
            presenter?.restaurantDetailReceived(result: result)
        }
    }
}
