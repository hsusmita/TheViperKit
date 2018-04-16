//
//  RestaurantDetailProtocols.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

protocol RestaurantDetailViewProtocol: class {
    var presenter: RestaurantDetailPresenterProtocol? { get set }
    func reload(detail: RestaurantDetailViewModel)
    func showError(title: String, message: String)
}

protocol RestaurantDetailPresenterProtocol: class {
    var view: RestaurantDetailViewProtocol? { get set }
    var interactor: RestaurantDetailInteractorInputProtocol? { get set }
    var router: Router? { get set }
    var scenePresenster: ScenePresenter? { get set }
    func viewDidLoad()
}

protocol RestaurantDetailInteractorOutputProtocol: class {
    func restaurantDetailReceived(result: ServiceResult<RestaurantDetail>)
}

protocol RestaurantDetailInteractorInputProtocol: class {
    var presenter: RestaurantDetailInteractorOutputProtocol? { get set }
    func fetchRestaurantDetail(id: String)
}
