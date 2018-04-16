//
//  RestaurantDetailPresenter.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 16/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

class RestaurantDetailPresenter: RestaurantDetailPresenterProtocol, RestaurantDetailInteractorOutputProtocol {
    var view: RestaurantDetailViewProtocol?
    var interactor: RestaurantDetailInteractorInputProtocol?    
    var router: Router?
    var scenePresenster: ScenePresenter?
    private let restaurantId: String
    
    init(restaurantId: String) {
        self.restaurantId = restaurantId
    }
    
    func viewDidLoad() {
       self.interactor?.fetchRestaurantDetail(id: self.restaurantId)
    }
    
    func restaurantDetailReceived(result: ServiceResult<RestaurantDetail>) {
        switch result {
        case .success(let detail):
            let viewModel = RestaurantDetailViewModel(restaurantDetail: detail)
            view?.reload(detail: viewModel)
            
        case .failure(let error):
            view?.showError(title: error.title, message: error.errorDescription ?? "")
        }
    }
}
