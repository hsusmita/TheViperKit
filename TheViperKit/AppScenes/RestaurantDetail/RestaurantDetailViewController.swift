//
//  RestaurantDetailViewController.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, View {	
	typealias Event = RestaurantDetailViewEvent
	typealias Command = RestaurantDetailPresenterCommand
	
	var eventListener: AnyEventListener<RestaurantDetailViewEvent>?
	
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var checkinsCountLabel: UILabel!
    @IBOutlet var usersCountLabel: UILabel!
    @IBOutlet var tipCountLabel: UILabel!
    @IBOutlet var visitsCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventListener?.handle(event: .viewDidLoad)
    }
	
	func handle(command: RestaurantDetailPresenterCommand) {
		switch command {
		case .reload(let detail):
			self.configureDetailView(model: detail)
		case .showError(let title, let message):
			self.showError(title: title, message: message)
		}
	}
	
    private func configureDetailView(model: RestaurantDetailViewModel) {
        self.nameLabel.text = model.restaurantViewModel.name
        self.likeCountLabel.text = model.likeCount
        self.checkinsCountLabel.text = model.restaurantStatModel.checkinsCount
        self.usersCountLabel.text = model.restaurantStatModel.usersCount
        self.tipCountLabel.text = model.restaurantStatModel.tipCount
        self.visitsCountLabel.text = model.restaurantStatModel.visitsCount
    }
	
	private func showError(title: String, message: String) {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertVC.addAction(alertAction)
		present(alertVC, animated: true, completion: nil)      
	}
}

extension RestaurantDetailViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
}

