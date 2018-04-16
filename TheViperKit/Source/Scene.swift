//
//  Scene.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

protocol Scene {
    var viewController: UIViewController { get }
}

extension Scene {
    func build<V: View, P: Presenter, I: Interactor>(view: V, presenter: P, interactor: I, scenePresenter: ScenePresenter?) where V.Event == P.Event,
        I.Request == P.Request, I.Response == P.Response, V.Command == P.Command {
            presenter.commandListener = AnyCommandListener<P.Command>(handler: view.handle)
            presenter.requestListener = AnyRequestListener<P.Request>(handler: interactor.handle)
            view.eventListener = AnyEventListener<P.Event>(handler: presenter.handle)
            interactor.responseListener = AnyResponseListener<P.Response>(handler: presenter.handle)
            if let scenePresenter = scenePresenter {
                presenter.router = Router()
                presenter.scenePresenter = scenePresenter
            }
    }
}
