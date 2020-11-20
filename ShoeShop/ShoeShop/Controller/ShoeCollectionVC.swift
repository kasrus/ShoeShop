//
//  ViewController.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/11/20.
//

import UIKit

class ShoeCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    struct Storyboard {
        static let shoeCell = "ShoeCell"
        static let sectionHeaderView = "SectionHeaderView"
        static let toDetailVC = "toDetailVC"
        static let toCheckOutVC = "toCheckOutVC"
    }
    
    var shoeStyles: [ShoeCollection] = DataService.instance.getShoes()
    var shoeModel: String = ""
    var shoeStyle: String = ""
    var shoeImageName: String = ""
    var shoePrice: String = ""
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
//MARK: - Collection View Data Source -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shoeStyles.count
    }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoeStyles[section].shoeCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 254)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.shoeCell, for: indexPath) as? ShoeCell {
            let shoeStyle = shoeStyles[indexPath.section].shoeCollection[indexPath.item]
            cell.updateViews(shoe: shoeStyle)
           
            return cell
        }
        return ShoeCell()
    }
    
    //New stuff for me - Section Header View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeaderView, for: indexPath) as! SectionHeaderView
        
        sectionHeaderView.styleTitle = shoeStyles[indexPath.section].style
        return sectionHeaderView
    }
    
    
    
    //MARK: - IBActions -
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        let cell: UICollectionViewCell? = (sender.superview?.superview as? ShoeCell) //track your view hierarchy
        let indexpath: IndexPath? = collectionView?.indexPath(for: cell!)
        let shoeDetail = DataService.instance.getShoes()[indexpath!.section].shoeCollection[indexpath!.item]
        DataService.instance.addShoesToCart(shoesAdded: ShoesInCart(
                                                shoe: Shoe(shoeImage: shoeDetail.shoeImage, model: shoeDetail.model, price: shoeDetail.price)))
        print (DataService.instance.getShoesInCart())
    }
    
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Storyboard.toCheckOutVC, sender: nil)
    }
//MARK: - Bar Button Item -
    func barButtonCustom () {
        let barBtn = UIBarButtonItem()
        barBtn.title = ""
        
        navigationItem.backBarButtonItem = barBtn
        navigationController?.navigationBar.tintColor = .white
    }
    //MARK: - UICollectionViewDelegate -
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoeDetail = DataService.instance.getShoes()[indexPath.section].shoeCollection[indexPath.item]
        
        let newShoeInfo = ShoeCollection(style: DataService.instance.getShoes()[indexPath.section].style, shoeCollection: [shoeDetail])

        performSegue(withIdentifier: Storyboard.toDetailVC, sender: newShoeInfo)
        
    }

    //MARK: - Navigation -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.toDetailVC {
            let destinationVC = segue.destination as! DetailVC
            barButtonCustom()
            let newShoeInfo = sender as! ShoeCollection
            destinationVC.loadViewIfNeeded()
            destinationVC.updateView(shoeInfo: newShoeInfo)
            destinationVC.shoesInCart = newShoeInfo
        }
     
        else if segue.identifier == Storyboard.toCheckOutVC {
 //           let destinationVC = segue.destination as! CheckOutVC
            barButtonCustom()
            
        }
 
    }
    

}

