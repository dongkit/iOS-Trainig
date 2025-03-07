//
//  FavoriteManager.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/7/25.
//

import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()
    
    private init() {} // Prevents other instances
    
    var favoriteTeachers: [Teacher] = []
    
    func toggleFavorite(teacher: Teacher) {
        if let index = favoriteTeachers.firstIndex(where: { $0.name == teacher.name }) {
            favoriteTeachers.remove(at: index) // Remove if already in favorites
        } else {
            favoriteTeachers.append(teacher) // Add if not in favorites
        }
    }
    
    func isFavorite(teacher: Teacher) -> Bool {
        return favoriteTeachers.contains(where: { $0.name == teacher.name })
    }
}
