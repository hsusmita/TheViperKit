//
//  AppScene.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

enum AppScene: Scene {    
    case feedList
    case feedDetail
    
    var viewController: UIViewController {
        switch self {
        case .feedList:
            return configureFeedList()
            
        case .feedDetail:
            return configureFeedDetail()
        }
    }
    
    private func configureFeedList() -> UIViewController {
        return FeedListViewController.storyboardInstance
    }
    
    private func configureFeedDetail() -> UIViewController {
        return FeedDetailViewController.storyboardInstance
    }
}
