//
//  Home.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
        }
    }
}

#Preview {
    Home()
}
