//
//  Onboarding2.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/27/25.
//

import SwiftUI

struct Onboarding2: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            Header()
            Text("Email notifications")
                .font(.title2)
            Toggle("Order statuses", isOn: $user.orderStatuses)
            Toggle("Password changes", isOn: $user.passwordChanges)
            Toggle("Special offers", isOn: $user.specialOffers)
            Toggle("Newsletter", isOn: $user.newsletter)
            
            NavigationLink(destination: Onboarding3()) {
                Text("Next")
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    Onboarding2()
}
