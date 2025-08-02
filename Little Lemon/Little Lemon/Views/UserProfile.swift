//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct UserProfile: View {
    @StateObject var user = User()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Header()
                NavigationLink(destination: Onboarding().navigationBarBackButtonHidden(true),
                               isActive: $user.loggedOut) {
                    EmptyView()
                }
                Text("Personal information")
                    .font(.title2)
                HStack(spacing: 20) {
                    Image("profile-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(.circle)
                    lemonButton(buttonText: "Change", buttonColor: .littleLemonGreen, invert: false, action: {})
                    lemonButton(buttonText: "Remove", buttonColor: .littleLemonGreen, invert: true, action: {})
                }
                // Info input boxes
                InputBox(title: "First Name", text: $user.firstName)
                InputBox(title: "Last Name", text: $user.lastName)
                InputBox(title: "Email", text: $user.email)
                
                // Toggle buttons
                Text("Email notifications")
                    .font(.title2)
                Toggle("Order statuses", isOn: $user.orderStatuses)
                Toggle("Password changes", isOn: $user.passwordChanges)
                Toggle("Special offers", isOn: $user.specialOffers)
                Toggle("Newsletter", isOn: $user.newsletter)
                
                // Save/Discard/Logout
                Button("Log out", action: {
                    user.clearValues()
                    user.save()
                })
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background(.littleLemonYellow)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 20)
                
                HStack(spacing: 15) {
                    lemonButton(buttonText: "Discard changes", buttonColor: .littleLemonGreen, invert: true, action: {
                        user.loadSavedValues()
                    })
                    Spacer()
                    lemonButton(buttonText: "Save changes", buttonColor: .littleLemonGreen, invert: false) {
                        if (user.isValid()) {
                            user.save()
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
