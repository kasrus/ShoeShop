//
//  ShoeCollection.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/11/20.
//

import Foundation

struct ShoeCollection {
    private(set) public var style: String
    private(set) public var shoeCollection:[Shoe]
    
    init(style: String, shoeCollection: [Shoe]) {
        self.style = style
        self.shoeCollection = shoeCollection
    }
}
