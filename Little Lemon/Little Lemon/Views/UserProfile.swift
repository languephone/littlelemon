//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var loggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    @State var orderStatuses = true
    @State var passwordChanges = true
    @State var specialOffers = true
    @State var newsletter = true
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Personal information")
                    .font(.title2)
                HStack(spacing: 20) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(.circle)
                    lemonButton(buttonText: "Change", buttonColor: .littleLemonGreen, invert: false, action: {})
                    lemonButton(buttonText: "Remove", buttonColor: .littleLemonGreen, invert: true, action: {})
                }
                // Info input boxes
                InputBox(title: "First Name", text: $firstName)
                InputBox(title: "Last Name", text: $lastName)
                InputBox(title: "Email", text: $email)
                
                // Toggle buttons
                Text("Email notifications")
                    .font(.title2)
                Toggle("Order statuses", isOn: $orderStatuses)
                Toggle("Password changes", isOn: $passwordChanges)
                Toggle("Special offers", isOn: $specialOffers)
                Toggle("Newsletter", isOn: $newsletter)
                
                // Save/Discard/Logout
                Button("Log out", action: {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                })
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.littleLemonYellow)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 20)
                
                HStack(spacing: 15) {
                    lemonButton(buttonText: "Discard changes", buttonColor: .littleLemonGreen, invert: true, action: {})
                    Spacer()
                    lemonButton(buttonText: "Save changes", buttonColor: .littleLemonGreen, invert: false) {
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    UserProfile()
}
