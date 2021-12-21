//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Luis Madriz on 11/17/21.
//

import Foundation

class StoreItemController {

func fetchItems(matching query: [String: String], completion: @escaping (Result<[StoreItem], Error>) -> Void) {
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    
    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
//        if let data = data {
//            do {
//                // make sure this JSON is in the format we expect
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    print(json)
//                    // try to read out a string array
//                    if let names = json["names"] as? [String] {
//                        print(names)
//                    }
//                }
//            } catch let error as NSError {
//                print("Failed to load: \(error.localizedDescription)")
//            }
//        }
        
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                completion(.success(searchResponse.results))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    task.resume()
    
    }
    
}

