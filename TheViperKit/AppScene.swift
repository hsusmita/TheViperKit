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
        return RestaurantListViewController.storyboardInstance
    }
    
    private func configureRestaurantDetail() -> UIViewController {
        return RestaurantDetailViewController.storyboardInstance
    }
}
