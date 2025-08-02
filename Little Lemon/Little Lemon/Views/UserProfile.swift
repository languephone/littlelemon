//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct UserProfile: View {
    @StateObject var viewModel = UserProfileViewModel()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
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
                InputBox(title: "First Name", text: $viewModel.user.firstName)
                InputBox(title: "Last Name", text: $viewModel.user.lastName)
                InputBox(title: "Email", text: $viewModel.user.email)
                
                // Toggle buttons
                Text("Email notifications")
                    .font(.title2)
                Toggle("Order statuses", isOn: $viewModel.user.orderStatuses)
                Toggle("Password changes", isOn: $viewModel.user.passwordChanges)
                Toggle("Special offers", isOn: $viewModel.user.specialOffers)
                Toggle("Newsletter", isOn: $viewModel.user.newsletter)
                
                // Save/Discard/Logout
                Button("Log out", action: {})
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
                        if (viewModel.isValidUser()) {
                            viewModel.saveUser()
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
