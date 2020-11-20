//
//  Shoe.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/11/20.
//

import Foundation

struct Shoe {
    private(set) public var shoeImage: String
    private(set) public var model: String
    private(set) public var price: String
    
    init(shoeImage: String, model: String, price: String) {
        self.shoeImage = shoeImage
        self.model = model
        self.price = price
    }
}
