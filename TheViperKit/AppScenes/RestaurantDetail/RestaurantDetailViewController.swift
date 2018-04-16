//
//  RestaurantDetailViewController.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var checkinsCountLabel: UILabel!
    @IBOutlet var usersCountLabel: UILabel!
    @IBOutlet var tipCountLabel: UILabel!
    @IBOutlet var visitsCountLabel: UILabel!
    
    private var restaurantDetailPresenter: RestaurantDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    private func configureDetailView(model: RestaurantDetailViewModel) {
        self.nameLabel.text = model.restaurantViewModel.name
        self.likeCountLabel.text = model.likeCount
        self.checkinsCountLabel.text = model.restaurantStatModel.checkinsCount
        self.usersCountLabel.text = model.restaurantStatModel.usersCount
        self.tipCountLabel.text = model.restaurantStatModel.tipCount
        self.visitsCountLabel.text = model.restaurantStatModel.visitsCount
    }
}

extension RestaurantDetailViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
}

extension RestaurantDetailViewController: RestaurantDetailViewProtocol {
    var presenter: RestaurantDetailPresenterProtocol? {
        get {
            return restaurantDetailPresenter
        }
        set {
            restaurantDetailPresenter = newValue
        }
    }
    
    func reload(detail: RestaurantDetailViewModel) {
        self.configureDetailView(model: detail)
    }
    
    func showError(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)      
    }
}
