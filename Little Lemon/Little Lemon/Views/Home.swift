//
//  Home.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared

    var body: some View {
        TabView {
            VStack {
                Header()
                Hero()
                Menu()
            }
            .environment(\.managedObjectContext, persistence.container.viewContext)
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    Home()
}
