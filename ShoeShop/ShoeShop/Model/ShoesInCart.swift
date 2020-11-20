//
//  ShoesInCart.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/16/20.
//

import Foundation

struct ShoesInCart {
    var shoe: Shoe
    var quantity: Int
    
    init(shoe: Shoe) {
        self.shoe = shoe
        self.quantity = 1
    }
}
