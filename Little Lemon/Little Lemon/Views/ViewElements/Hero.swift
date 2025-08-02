//
//  Hero.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/23/25.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Little Lemon")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontDesign(.serif)
                .foregroundStyle(.littleLemonYellow)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("London")
                        .font(.title)
                        .fontWeight(.medium)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                        .padding(.bottom, 15)
                    Text("We are a modern take on Mediterranean food in the heart of London's financial district, focused on traditional recipies served with a modern twist.")
                        .foregroundStyle(.white)
                }
                    Image("food-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .padding(20)
        .background(Color.littleLemonGreen)
    }
}

#Preview {
    Hero()
}
