//
//  RestaurantListPresenter.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantListPresenter: Presenter {
	typealias Event = RestaurantListViewEvent
	typealias Command = RestaurantListPresenterCommand
	typealias Request = RestaurantListInteractorRequest
	typealias Response = RestaurantListInteractorResponse
	
	var requestListener: AnyRequestListener<RestaurantListInteractorRequest>?
	var commandListener: AnyCommandListener<RestaurantListPresenterCommand>?
	var scenePresenter: ScenePresenter?
    var router: Router?
    
	func handle(event: RestaurantListViewEvent) {
		switch event {
		case .viewDidLoad:
			self.requestListener?.handle(request: .fetchNearbyRestaurants)
		case .didSelect(let viewModel):
			self.didSelect(viewModel: viewModel)
		}
	}
	
	func handle(response: RestaurantListInteractorResponse) {
		switch response {
		case .restaurantsReceived(let result):
			self.restaurantsReceived(result: result)
		}
	}
	
    private func viewDidLoad() {
        self.requestListener?.handle(request: .fetchNearbyRestaurants)
    }
    
    private func restaurantsReceived(result: ServiceResult<[Restaurant]>) {
        switch result {
        case .success(let restaurants):
            let list = restaurants.map { RestaurantViewModel(restaurant: $0) }
            self.commandListener?.handle(command: .reload(list: list))
        case .failure(let error):
			self.commandListener?.handle(command: .showError(title: error.title, message: error.errorDescription ?? ""))
        }
    }
    
    private func didSelect(viewModel: RestaurantViewModel) {
        guard let scenePresenster = scenePresenter else {
            return
        }
        router?.present(scene: AppScene.restaurantDetail(id: viewModel.id), scenePresenter: scenePresenster)
    }    
}
