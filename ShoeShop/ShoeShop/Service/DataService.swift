//
//  DataService.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/11/20.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let shoeCollection = [
        ShoeCollection(style: "MoMa", shoeCollection: [
            Shoe(shoeImage: "moma1.png", model: "Kandinsky", price: "$80.00"),
            Shoe(shoeImage: "moma2.png", model: "Comfycush", price: "$80.00"),
            Shoe(shoeImage: "moma3.png", model: "Monet Authentic", price: "$80.00"),
            Shoe(shoeImage: "moma4.png", model: "Ringgold", price: "$85.00")
        ]),
        ShoeCollection(style: "High Top", shoeCollection: [
            Shoe(shoeImage: "hightop1.png", model: "Popova Sk8-Hi", price: "$90.00"),
            Shoe(shoeImage: "hightop2.png", model: "SK8-Hi", price: "$65.00"),
            Shoe(shoeImage: "hightop3.png", model: "Mix & Match", price: "$65.00")
        ]),
        ShoeCollection(style: "Slip-On", shoeCollection: [
            Shoe(shoeImage: "slipon1.png", model: "Red Roses Classic", price: "$60.00"),
            Shoe(shoeImage: "slipon2.png", model: "Blue Classic", price: "$50.00"),
            Shoe(shoeImage: "slipon3.png", model: "Soft Leather", price: "$65.00"),
            Shoe(shoeImage: "slipon4.png", model: "Checkboard", price: "$50.00")
        ])
    ]
    
    var shoesAdded = ShoesInCart(shoe: Shoe(shoeImage: "", model: "", price: ""))
    
    var shoesInCart = [ShoesInCart]()
    
    func addShoesToCart(shoesAdded: ShoesInCart) {
        //if the same model already existed in the cart
        //update the quantity
        if let i = shoesInCart.firstIndex(where: { $0.shoe.model == shoesAdded.shoe.model }) {
            //update the quantity
            shoesInCart[i].quantity += 1
        }
        //if this is the first time the model being added
        else {
            //update quantity
            self.shoesAdded.quantity += 1
            shoesInCart.append(shoesAdded)
        }
    }
    
    //updates the number of shoe quantity in the array depends on the operation
    func updateShoesQuantity (operation: String, index: Int) -> [ShoesInCart]{
        if operation == "+" {
            shoesInCart[index].quantity += 1
        }
        else {
            shoesInCart[index].quantity -= 1
        }
        
        return shoesInCart
    }
    
    //delete the data from the array at given index if the quantity is 0
    func isQuantityZero (index: Int) -> Bool {
        if shoesInCart[index].quantity == 0 {
            shoesInCart.remove(at: index)
            return true
        }
        return false
    }
    
    func getShoeToUpdate(index: Int) -> ShoesInCart {
        return shoesInCart[index]
    }
    
    func getShoesInCart() -> [ShoesInCart] {
        return shoesInCart
    }
    
    func getShoes() -> [ShoeCollection] {
        return shoeCollection
    }
    //getting image names
    func generateImage(stylePrefix: String, numberOfImages: Int) -> [String] {
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(stylePrefix)\(i)")
        }
        
        return imageNames
    }
}
