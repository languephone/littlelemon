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
    let description: String
    let price: String
    let image: String
    let category: String
}
