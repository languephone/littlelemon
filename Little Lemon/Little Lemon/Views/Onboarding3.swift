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
                    user.loggedIn = true
                    user.save()
                    print(user.firstName)
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
