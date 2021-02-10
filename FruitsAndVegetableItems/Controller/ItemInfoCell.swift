//
//  MyTableViewCell.swift
//  FruitsAndVegetableItems
//
//  Created by SrinathCholleti on 10/02/21.
//

import UIKit

class ItemInfoCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var item : Item?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(){
        
        nameLabel.text = item?.name
        priceLabel.text = item?.price
        
            if let cellItem = self.item{
                self.itemImageView.downloaded(from: cellItem.image)
                //calling the downloaded function from UIImageView Extension to download particular cell image using the link provided in the JSON data

            }
        

    }

}
