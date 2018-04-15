//
//  RestuarantViewModel.swift
//  TheViperKit
//
//  Created by Susmita Horrow on 15/04/18.
//  Copyright © 2018 Susmita. All rights reserved.
//

import Foundation

struct RestaurantViewModel {
    let name: String
    let address: String
    let rating: String
    let price: String
    let verified: Bool
    
    init(name: String, address: String, rating: String, price: String, verified: Bool) {
        self.name = name
        self.address = address
        self.rating = rating
        self.price = price
        self.verified = verified
    }
    
    init(restaurant: Restaurant) {
        self.name = restaurant.name
        self.price = "Price Tier: \(restaurant.price)"
        self.verified = restaurant.verified
        if let rating = restaurant.rating {
            self.rating = "Rating: \(rating)"
        } else {
            self.rating = ""
        }
        if let locationAddress = restaurant.location.address {
            self.address = locationAddress
        } else {
            self.address = restaurant.location.formattedAddress.reduce("", { (result, string) in
                return string.isEmpty ? result : (result + ", " + string)
            })
        }
    }
}
