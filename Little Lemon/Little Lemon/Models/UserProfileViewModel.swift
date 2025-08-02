//
//  UserProfileViewModel.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/31/25.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user = User()

    init() {
        getUser()
    }

    func getUser() {
        user = User(
            firstName: UserDefaults.standard.string(forKey: "kFirstName") ?? "",
            lastName: UserDefaults.standard.string(forKey: "kLastName") ?? "",
            email: UserDefaults.standard.string(forKey: "kEmail") ?? "",
            loggedIn: UserDefaults.standard.bool(forKey: "kLoggedIn"),
            orderStatuses: UserDefaults.standard.bool(forKey: "kOrderStatuses"),
            passwordChanges: UserDefaults.standard.bool(forKey: "kPasswordChanges"),
            specialOffers: UserDefaults.standard.bool(forKey: "kSpecialOffers"),
            newsletter: UserDefaults.standard.bool(forKey: "kNewsletter")
        )
    }

    func saveUser() {
        UserDefaults.standard.set(user.firstName, forKey: "kFirstName")
        UserDefaults.standard.set(user.lastName, forKey: "kLastName")
        UserDefaults.standard.set(user.email, forKey: "kEmail")
        UserDefaults.standard.set(user.loggedIn, forKey: "kLoggedIn")
        UserDefaults.standard.set(user.orderStatuses, forKey: "kOrderStatuses")
        UserDefaults.standard.set(user.passwordChanges, forKey: "kPasswordChanges")
        UserDefaults.standard.set(user.specialOffers, forKey: "kSpecialOffers")
        UserDefaults.standard.set(user.newsletter, forKey: "kNewsletter")
    }

    func isValidUser() -> Bool {
        return !user.firstName.isEmpty &&
               !user.lastName.isEmpty &&
               !user.email.isEmpty
    }
    
}
