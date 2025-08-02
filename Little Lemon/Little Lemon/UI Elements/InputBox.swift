//
//  InputBox.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/26/25.
//

import SwiftUI

struct InputBox: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.callout)
            TextField(title, text: $text)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray, lineWidth: 1)
                )
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    InputBox(title: "First name", text: .constant("Bluebear"))
}
