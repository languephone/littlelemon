//
//  Button.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/26/25.
//

import SwiftUI

struct lemonButton: View {
    let buttonText: String
    let buttonColor: Color
    let invert: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            if invert {
                Text(buttonText)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background(.white)
                    .foregroundStyle(buttonColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(buttonColor, lineWidth: 1)
                    )
            } else {
                Text(buttonText)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 12)
                    .background(buttonColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    lemonButton(buttonText: "Save Changes",
                buttonColor: .littleLemonGreen,
                invert: false,
                action: {}
    )
    lemonButton(buttonText: "Save Changes",
                buttonColor: .littleLemonGreen,
                invert: true,
                action: {}
    )
}
