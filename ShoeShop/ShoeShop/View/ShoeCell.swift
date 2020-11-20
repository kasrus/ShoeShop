//
//  ShoeCell.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/12/20.
//

import UIKit

class ShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func updateViews(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.shoeImage)
        modelLabel.text = shoe.model
        priceLabel.text = shoe.price
    }
}
