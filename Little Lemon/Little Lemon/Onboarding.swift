//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var loggedIn = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Menu(), isActive: $loggedIn) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("email", text: $email)
                Button("Register") {
                    if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        loggedIn = true
                    }
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
