//
//  Onboarding3.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/28/25.
//

import SwiftUI

struct Onboarding3: View {
    @EnvironmentObject var user: User

    var body: some View {
        VStack {
            Text(user.firstName)
            Text(user.lastName)
            Text(user.email)
            
            Button("Register") {
                if (!user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty) {
                    UserDefaults.standard.set(user.firstName, forKey: "kFirstName")
                    UserDefaults.standard.set(user.lastName, forKey: "kLastName")
                    UserDefaults.standard.set(user.email, forKey: "kEmail")
                    UserDefaults.standard.set(user.loggedIn, forKey: "kLoggedIn")
                    UserDefaults.standard.set(user.orderStatuses, forKey: "kOrderStatuses")
                    UserDefaults.standard.set(user.passwordChanges, forKey: "kPasswordChanges")
                    UserDefaults.standard.set(user.specialOffers, forKey: "kSpecialOffers")
                    UserDefaults.standard.set(user.newsletter, forKey: "kNewsletter")
                    user.loggedIn = true
                }
            }
            
            NavigationLink(destination: Home(), isActive: $user.loggedIn) {
                EmptyView()
            }
        }
    }
}

#Preview {
    Onboarding3()
}
