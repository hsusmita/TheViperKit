//
//  RestaurantDetailPresenter.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 16/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantDetailPresenter: Presenter {
	typealias Event = RestaurantDetailViewEvent
	typealias Command = RestaurantDetailPresenterCommand
	typealias Request = RestaurantDetailInteractorRequest
	typealias Response = RestaurantDetailInteractorResponse
	
	var requestListener: AnyRequestListener<RestaurantDetailInteractorRequest>?
	var commandListener: AnyCommandListener<RestaurantDetailPresenterCommand>?	
	var router: Router?
	var scenePresenter: ScenePresenter?
	
    private let restaurantId: String
    
    init(restaurantId: String) {
        self.restaurantId = restaurantId
    }
    
	func handle(event: RestaurantDetailViewEvent) {
		switch event {
		case .viewDidLoad:
			self.requestListener?.handle(request: .fetchRestaurantDetail(id: self.restaurantId))
		}
	}
	
	func handle(response: RestaurantDetailInteractorResponse) {
		switch response {
		case .restaurantDetailReceived(let result):
			self.restaurantDetailReceived(result: result)
		}
	}
	
   func restaurantDetailReceived(result: ServiceResult<RestaurantDetail>) {
        switch result {
        case .success(let detail):
            let viewModel = RestaurantDetailViewModel(restaurantDetail: detail)
            self.commandListener?.handle(command: .reload(detail: viewModel))
            
        case .failure(let error):
			self.commandListener?.handle(command: .showError(title: error.title, message: error.errorDescription ?? ""))
        }
    }
}
