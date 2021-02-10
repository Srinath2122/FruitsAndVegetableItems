//
//  DetailViewController.swift
//  FruitsAndVegetableItems
//
//  Created by SrinathCholleti on 10/02/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    var item : Item? //declaring Item variable to be able to get the data from TableViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let localItem = self.item{
            itemImageView.downloaded(from: localItem.image)
            //calling the downloaded function from UIImageView Extension to download particular cell image using the link provided in the JSON data

        }
        nameLabel.text = item?.name
        priceLabel.text = item?.price
        descTextView.text = item?.description
        
    }
    

}
