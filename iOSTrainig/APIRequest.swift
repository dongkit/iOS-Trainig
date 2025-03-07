//
//  APIRequest.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/7/25.
//

import Foundation

class APIRequest {
    static let shared = APIRequest()

    func fetchProducts(completion: @escaping ([ProductsResponse.Product] ) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return completion([])
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let productsResponse = try decoder.decode(ProductsResponse.self, from: data)
                completion(productsResponse.products)
            } catch {
                print("Error: \(error.localizedDescription)")
                completion([])
            }
            
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("Response Data: \(jsonString)")
//            }
        }
        task.resume()
    }
}
