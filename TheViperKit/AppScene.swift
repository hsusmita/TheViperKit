//
//  AppScene.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

enum AppScene: Scene {    
    case restaurantList
    case restaurantDetail(id: String)
    
    var viewController: UIViewController {
        switch self {
        case .restaurantList:
            return configureRestaurantList()
            
        case .restaurantDetail(let id):
            return configureRestaurantDetail(id: id)
        }
    }
    
    private func configureRestaurantList() -> UIViewController {
        let viewController = RestaurantListViewController.storyboardInstance
        let presenter = RestaurantListPresenter()
        let interactor = RestaurantListInteractor(baseApiClient: BaseAPIClient.shared)
		self.build(view: viewController,
				   presenter: presenter, 
				   interactor: interactor,
				   scenePresenter: viewController)
         let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    private func configureRestaurantDetail(id: String) -> UIViewController {
        let viewController = RestaurantDetailViewController.storyboardInstance
        let presenter = RestaurantDetailPresenter(restaurantId: id)
        let interactor = RestaurantDetailInteractor(baseApiClient: BaseAPIClient.shared)
		self.build(view: viewController,
				   presenter: presenter, 
				   interactor: interactor,
				   scenePresenter: nil)
        return viewController
    }
}
