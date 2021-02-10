//
//  ItemsTableViewController.swift
//  FruitsAndVegetableItems
//
//  Created by SrinathCholleti on 10/02/21.
//

import UIKit

class ItemsTableViewController: UITableViewController {
 
    var fruitsAndVegData : FruitAndVegeData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruitsAndVegManager = FruitandVegManager()//creating FruitandVegManager instance
        
        fruitsAndVegManager.delegate = self
        
        fruitsAndVegManager.getData() //calling this func to download JSON data and to store it as FruitAndVegeData model
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fruitsAndVegData?.categoryData.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let modelData = fruitsAndVegData{
            return modelData.categoryData[section].item.count
    }
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    if let modelData = fruitsAndVegData{
        return modelData.categoryData[section].name
    }
    return ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedVC") as! DetailViewController //creating next view controller instance
        vc.item = fruitsAndVegData?.categoryData[indexPath.section].item[indexPath.row]
        //passing the indexPath to next viewController to present in Detail VC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemInfoCellID", for: indexPath) as! ItemInfoCell
        
        cell.item = fruitsAndVegData?.categoryData[indexPath.section].item[indexPath.row]
        //sending the indexPath to cell to be able download image for that cell
        cell.setUp() // sets the image,name &price of ItemTableView
        return cell
    }
}

// MARK: - FruitandVegManagerDelegate Implementation

extension ItemsTableViewController: FruitandVegManagerDelegate {
    func didLoadItems(itemsData: FruitAndVegeData) {
        fruitsAndVegData = itemsData
//        print("full Dict Data : \(fruitsAndVegData)")
        DispatchQueue.main.async {
            self.tableView.reloadData() //reloading the tableview after getting the data from webservice
        }
    }

}
