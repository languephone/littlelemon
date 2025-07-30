//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/21/25.
//

import Foundation

struct MenuItem: Codable {
    let id: Int
    let title: String
    let dishDescription: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case dishDescription = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}

