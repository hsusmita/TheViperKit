//
//  Router.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class Router {
    func launch(scene: Scene) {
        let window = UIApplication.shared.keyWindow
        let viewController = scene.viewController
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func present(scene: Scene, scenePresenter: ScenePresenter) {
        let viewController = scene.viewController
        scenePresenter.present(viewController: viewController)
    }
}
