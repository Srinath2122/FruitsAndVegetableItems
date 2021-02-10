//
//  FruitAndVegManager.swift
//  FruitsAndVegetableItems
//
//  Created by SrinathCholleti on 10/02/21.
//

import Foundation

protocol FruitandVegManagerDelegate {
    func didLoadItems(itemsData: FruitAndVegeData)
}
class FruitandVegManager {
    
    let group = DispatchGroup()
    
    var delegate: FruitandVegManagerDelegate?
    
    let itemsURL = "https://raw.githubusercontent.com/Epistemology/demo/main/secondround.json"

    func getData(){
        let url = URL(string: itemsURL)
        URLSession.shared.fruitAndVegeDataTask(with: url!) { (data, response, error) in
                if error == nil, let modelData = data {
                    self.delegate?.didLoadItems(itemsData: modelData)
                }
          }.resume()
    }
}
