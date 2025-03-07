//
//  DataManager.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/7/25.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var name: String?
    
    private init() {
        
    }
    
    func fetchData() {
        print("Fetching data...")
    }
}
