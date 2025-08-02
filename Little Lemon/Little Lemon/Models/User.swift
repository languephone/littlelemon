//
//  User.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/29/25.
//

import Foundation

class User: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var loggedIn: Bool
    @Published var orderStatuses: Bool
    @Published var passwordChanges: Bool
    @Published var specialOffers: Bool
    @Published var newsletter: Bool

    init(firstName: String = "",
         lastName: String = "",
         email: String = "",
         loggedIn: Bool = false,
         orderStatuses: Bool = true,
         passwordChanges: Bool = true,
         specialOffers: Bool = true,
         newsletter: Bool = true) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.loggedIn = loggedIn
        self.orderStatuses = orderStatuses
        self.passwordChanges = passwordChanges
        self.specialOffers = specialOffers
        self.newsletter = newsletter
    }
}
