//
//  SectionHeaderView.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/12/20.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var styleTitleLabel: UILabel!
   
    var styleTitle: String! {
        didSet {
            styleTitleLabel.text = styleTitle
        }
    }
    
}
