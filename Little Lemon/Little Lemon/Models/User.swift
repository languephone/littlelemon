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
    @Published var loggedOut: Bool

    init() {
        self.firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
        self.lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
        self.email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
        self.orderStatuses = UserDefaults.standard.bool(forKey: "kOrderStatuses")
        self.passwordChanges = UserDefaults.standard.bool(forKey: "kPasswordChanges")
        self.specialOffers = UserDefaults.standard.bool(forKey: "kSpecialOffers")
        self.newsletter = UserDefaults.standard.bool(forKey: "kNewsletter")
        self.loggedIn = UserDefaults.standard.bool(forKey: "kLoggedIn")
        self.loggedOut = !UserDefaults.standard.bool(forKey: "kLoggedIn")
    }

    func save() {
        UserDefaults.standard.set(firstName, forKey: "kFirstName")
        UserDefaults.standard.set(lastName, forKey: "kLastName")
        UserDefaults.standard.set(email, forKey: "kEmail")
        UserDefaults.standard.set(orderStatuses, forKey: "kOrderStatuses")
        UserDefaults.standard.set(passwordChanges, forKey: "kPasswordChanges")
        UserDefaults.standard.set(specialOffers, forKey: "kSpecialOffers")
        UserDefaults.standard.set(newsletter, forKey: "kNewsletter")
        UserDefaults.standard.set(loggedIn, forKey: "kLoggedIn")
        UserDefaults.standard.set(!loggedIn, forKey: "kLoggedOut")
    }

    func isValid() -> Bool {
        return !firstName.isEmpty &&
               !lastName.isEmpty &&
               !email.isEmpty
    }

    func clearValues() {
        firstName = ""
        lastName = ""
        email = ""
        orderStatuses = true
        passwordChanges = true
        specialOffers = true
        newsletter = true
        loggedIn = false
        loggedOut = true
    }

    func loadSavedValues() {
        self.firstName = UserDefaults.standard.string(forKey: "kFirstName") ?? ""
        self.lastName = UserDefaults.standard.string(forKey: "kLastName") ?? ""
        self.email = UserDefaults.standard.string(forKey: "kEmail") ?? ""
        self.orderStatuses = UserDefaults.standard.bool(forKey: "kOrderStatuses")
        self.passwordChanges = UserDefaults.standard.bool(forKey: "kPasswordChanges")
        self.specialOffers = UserDefaults.standard.bool(forKey: "kSpecialOffers")
        self.newsletter = UserDefaults.standard.bool(forKey: "kNewsletter")
        self.loggedIn = UserDefaults.standard.bool(forKey: "kLoggedIn")
        self.loggedOut = !UserDefaults.standard.bool(forKey: "kLoggedIn")
    }
}
