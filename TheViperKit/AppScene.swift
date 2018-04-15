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
    case restaurantDetail
    
    var viewController: UIViewController {
        switch self {
        case .restaurantList:
            return configureRestaurantList()
            
        case .restaurantDetail:
            return configureRestaurantDetail()
        }
    }
    
    private func configureRestaurantList() -> UIViewController {
        let viewController = RestaurantListViewController.storyboardInstance
        let presenter = RestaurantListPresenter()
        let interactor = RestaurantListInteractor(baseApiClient: BaseAPIClient.shared)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        return viewController
    }
    
    private func configureRestaurantDetail() -> UIViewController {
        return RestaurantDetailViewController.storyboardInstance
    }
}
