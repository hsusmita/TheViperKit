//
//  RestaurantListPresenter.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantListPresenter: RestaurantListPresenterProtocol, RestaurantListInteractorOutputProtocol {
    weak var view: RestaurantListViewProtocol?    
    var interactor: RestaurantListInteractorInputProtocol?
    var router: Router?
    var scenePresenster: ScenePresenter?
    
    func viewDidLoad() {
        interactor?.fetchNearbyRestaurants()
    }
    
    func restaurantsReceived(result: ServiceResult<[Restaurant]>) {
        switch result {
        case .success(let restaurants):
            let list = restaurants.map { RestaurantViewModel(restaurant: $0) }
            view?.reload(list: list)
        case .failure(let error):
            view?.showError(title: error.title, message: error.errorDescription ?? "")
        }
    }
    
    func didSelect(viewModel: RestaurantViewModel) {
        guard let scenePresenster = scenePresenster else {
            return
        }
        router?.present(scene: AppScene.restaurantDetail(id: viewModel.id), scenePresenter: scenePresenster)
    }    
}
