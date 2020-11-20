//
//  DetailVC.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/12/20.
//

import UIKit

class DetailVC: UIViewController {
    var shoesInCart: ShoeCollection = ShoeCollection(style: "", shoeCollection:[Shoe]())
    
    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VANS"
    }
    
    func updateView (shoeInfo: ShoeCollection) {
        styleLabel.text = shoeInfo.style
        shoeImageView.image = UIImage(named: shoeInfo.shoeCollection[0].shoeImage)
        modelLabel.text = shoeInfo.shoeCollection[0].model
        priceLabel.text = shoeInfo.shoeCollection[0].price
    }

    @IBAction func addToCartTapped(_ sender: Any) {
        DataService.instance.addShoesToCart(shoesAdded: ShoesInCart(shoe: Shoe(shoeImage: shoesInCart.shoeCollection[0].shoeImage, model: shoesInCart.shoeCollection[0].model, price: shoesInCart.shoeCollection[0].price)))
     
    }
}
