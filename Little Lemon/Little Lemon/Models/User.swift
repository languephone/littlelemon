//
//  User.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/29/25.
//

import Foundation

class User: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var loggedIn = false
    @Published var orderStatuses = true
    @Published var passwordChanges = true
    @Published var specialOffers = true
    @Published var newsletter = true

    init(firstName: String = "", lastName: String = "", email: String = "", loggedIn: Bool = false, orderStatuses: Bool = true, passwordChanges: Bool = true, specialOffers: Bool = true, newsletter: Bool = true) {
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
