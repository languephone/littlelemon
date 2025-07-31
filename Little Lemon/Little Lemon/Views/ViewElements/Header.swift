//
//  Header.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/24/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            Image("LogoHorizontal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            HStack {
                Spacer()
                Image("profile-image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
    }
}

#Preview {
    Header()
}
