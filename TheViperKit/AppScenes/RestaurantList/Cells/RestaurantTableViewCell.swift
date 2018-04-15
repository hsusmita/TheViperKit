//
//  RestaurantTableViewCell.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var addressLabel: UILabel!
	@IBOutlet var ratingLabel: UILabel!
	@IBOutlet var priceLabel: UILabel!

	func configure(model: RestaurantViewModel) {
		self.nameLabel.text = model.name
		self.addressLabel.text = model.address
		self.priceLabel.text = model.price
		self.ratingLabel.text = model.rating
	}
}
