//
//  Product.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/7/25.
//

import Foundation

struct ProductsResponse: Decodable {
    let products: [Product]
    
    struct Product: Decodable {
        let id: Int
        let title: String
        let description: String
        let category: String
        let price: Double
        let thumbnail: String?
    }
}
