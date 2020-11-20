//
//  CheckOutVC.swift
//  ShoeShop
//
//  Created by Kasumi Ruslim on 11/16/20.
//

import UIKit

class CheckOutVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ShoesInCartCellDelegate {
    
    struct Storyboard {
        static let checkOutItems = "checkOutItemsCell"
        static let toPurchaseVC = "toPurchaseVC"
    }
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var roundCornerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        navigationItem.title = "VANS"
        roundCornerBtn.layer.cornerRadius = 4
    }
    
    //MARK: - MyCellDelegate -
    func increaseButtonTapped(cell: ShoesInCartCell) {
        if let indexPath = self.cartTableView.indexPath(for: cell) {
            let newShoesQuantity = DataService.instance.updateShoesQuantity(operation: "+", index: indexPath.row)
            cell.shoeQuantity.text = String(newShoesQuantity[indexPath.row].quantity)
        }
    }
    
    func decreaseButtonTapped(cell: ShoesInCartCell) {
        if let indexPath = self.cartTableView.indexPath(for: cell) {
            let newShoesQuantity = DataService.instance.updateShoesQuantity(operation: "-", index: indexPath.row)
            //if the quantity of the shoe in that cell is 0, delete cell
            if DataService.instance.isQuantityZero(index: indexPath.row) {
                cartTableView.beginUpdates()
                cartTableView.deleteRows(at: [indexPath], with: .fade)
                cartTableView.endUpdates()
            }
            else {
                cell.shoeQuantity.text = String(newShoesQuantity[indexPath.row].quantity)
            }
        
        }
        
    }
    
//MARK: - Table View Data Source -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getShoesInCart().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkOutItems) as? ShoesInCartCell {
            
            let shoesToShow = DataService.instance.getShoesInCart()[indexPath.row]
            cell.delegate = self
            cell.updateCells(shoesInCart: shoesToShow)
            return cell
        } else {
            return ShoesInCartCell()
        }
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }
    
    //MARK: - IBAction -
    @IBAction func purchaseBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: Storyboard.toPurchaseVC, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.toPurchaseVC {
            if let purchaseVC = segue.destination as? PurchaseVC {
                let barBtn = UIBarButtonItem()
                barBtn.title = ""
                    
                navigationItem.backBarButtonItem = barBtn
                navigationController?.navigationBar.tintColor = .white
                purchaseVC.navigationItem.title = "VANS"
            }
        }
    }
 
}
