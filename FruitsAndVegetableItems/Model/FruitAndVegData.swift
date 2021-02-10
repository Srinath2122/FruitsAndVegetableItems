//
//  FruitAndVegData.swift
//  FruitsAndVegetableItems
//
//  Created by SrinathCholleti on 10/02/21.
//


import Foundation

// MARK: - FruitAndVegeData
struct FruitAndVegeData: Codable {
    var categoryData: [CategoryData]
}


// MARK: - CategoryDatum
struct CategoryData: Codable {
    var name: String
    var item: [Item]
}


// MARK: - Item
struct Item: Codable {
    var name, price: String
    var image: String
    var description: String
}


// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

// MARK: - URLSession response handlers

extension URLSession {
     func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func fruitAndVegeDataTask(with url: URL, completionHandler: @escaping (FruitAndVegeData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
