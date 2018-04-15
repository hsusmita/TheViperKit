//
//  RestaurantListViewController.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private var restaurantListPresenter: RestaurantListPresenterProtocol?
    private var restaurantViewModels: [RestaurantViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.viewDidLoad()
    }
    
    private func configureTableView() {
        let nib = UINib(nibName: "RestaurantTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: "RestaurantTableViewCell")
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150.0
    }
}

extension RestaurantListViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return "Main"
    }
}

extension RestaurantListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        cell.configure(model: self.restaurantViewModels[indexPath.row])
        return cell
    }
}

extension RestaurantListViewController: RestaurantListViewProtocol {
    var presenter: RestaurantListPresenterProtocol? {
        get {
            return restaurantListPresenter
        }
        set {
            restaurantListPresenter = newValue
        }
    }
    
    func reload(list: [RestaurantViewModel]) {
        self.restaurantViewModels = list
        self.tableView.reloadData()
    }
    
    func showError(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
