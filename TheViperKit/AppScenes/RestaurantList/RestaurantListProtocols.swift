//
//  RestuarantListProtocols.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

protocol RestaurantListViewProtocol: class {
    var presenter: RestaurantListPresenterProtocol? { get set }
    func reload(list: [RestaurantViewModel])
    func showError(title: String, message: String)
}

protocol RestaurantListPresenterProtocol: class {
    var view: RestaurantListViewProtocol? { get set }
    var interactor: RestaurantListInteractorInputProtocol? { get set }
    var router: Router? { get set }
    var scenePresenster: ScenePresenter? { get set }
    func viewDidLoad()
    func didSelect(viewModel: RestaurantViewModel)
}

protocol RestaurantListInteractorOutputProtocol: class {
    func restaurantsReceived(result: ServiceResult<[Restaurant]>)
}

protocol RestaurantListInteractorInputProtocol: class {
    var presenter: RestaurantListInteractorOutputProtocol? { get set }
    func fetchNearbyRestaurants()
}
