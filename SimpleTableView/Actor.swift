//
//  Actor.swift
//  SimpleTableView
//
//  Created by Mateus Rovari on 09/09/19.
//  Copyright © 2019 Mateus Rovari. All rights reserved.
//

import UIKit

class Actors: Codable {
    let places: [Actor]
    
    init(places: [Actor]) {
        self.places = places
    }
}

class Actor: NSObject, Codable {
    
    let place: String
    let place_delivery: String
    let place_description: String
    let place_address: String
    let place_cover: String
    
    init(place: String, place_delivery: String, place_description: String, place_address: String, place_cover: String) {
        self.place = place
        self.place_delivery = place_delivery
        self.place_description = place_description
        self.place_address = place_address
        self.place_cover = place_cover
    }
}
