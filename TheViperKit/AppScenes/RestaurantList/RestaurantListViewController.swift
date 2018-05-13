//
//  RestaurantListViewController.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController, View {
	typealias Event = RestaurantListViewEvent
	typealias Command = RestaurantListPresenterCommand
	
	var eventListener: AnyEventListener<RestaurantListViewEvent>?
    
	@IBOutlet var tableView: UITableView!
    private var restaurantViewModels: [RestaurantViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        eventListener?.handle(event: .viewDidLoad)
    }
    
    private func configureTableView() {
        let nib = UINib(nibName: "RestaurantTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: "RestaurantTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150.0
    }
	
	func handle(command: RestaurantListPresenterCommand) {
		switch command {
		case .reload(let list):
			self.reload(list: list)
		case .showError(let title, let message):
			self.showError(title: title, message: message)
		}
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

extension RestaurantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.eventListener?.handle(event: .didSelect(viewModel: restaurantViewModels[indexPath.row]))
    }
}

extension RestaurantListViewController {
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
}

extension RestaurantListViewController: ScenePresenter {
    func present(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
