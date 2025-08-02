//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct Onboarding: View {
    @StateObject var user: User = User()

    var body: some View {
        NavigationView {
            VStack {
                Header()
                NavigationLink(destination: Home().navigationBarBackButtonHidden(true), isActive: $user.loggedIn) {
                    EmptyView()
                }
                VStack {
                    InputBox(title: "First Name", text: $user.firstName)
                    InputBox(title: "Last Name", text: $user.lastName)
                    InputBox(title: "email", text: $user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
                NavigationLink(destination: Onboarding2()) {
                    Text("Next")
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .environmentObject(user)
    }
}

#Preview {
    Onboarding()
}
