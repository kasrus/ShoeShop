//
//  shoesInCartCellTableViewCell.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/16/20.
//

import UIKit

protocol ShoesInCartCellDelegate: AnyObject {
    func increaseButtonTapped(cell: ShoesInCartCell)
    func decreaseButtonTapped(cell: ShoesInCartCell)
}

class ShoesInCartCell: UITableViewCell {

    @IBOutlet weak var shoeImageLabel: UIImageView!
    @IBOutlet weak var shoeModel: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var shoeQuantity: UILabel!
    
    @IBOutlet weak var increaseBtn: UIButton!
    @IBOutlet weak var decreaseBtn: UIButton!
    
    
    weak var delegate: ShoesInCartCellDelegate?
    
    func updateCells(shoesInCart: ShoesInCart) {
        shoeImageLabel.image = UIImage(named: shoesInCart.shoe.shoeImage)
        shoeModel.text = shoesInCart.shoe.model
        shoePrice.text = shoesInCart.shoe.price
        shoeQuantity.text = String(shoesInCart.quantity)
    }

    @IBAction func increaseBtnTapped(_ sender: Any) {
        delegate?.increaseButtonTapped(cell: self)
    }
    
    @IBAction func decreaseBtnTapped(_ sender: Any) {
        delegate?.decreaseButtonTapped(cell: self)
    }
    
}
