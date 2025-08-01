//
//  Menu.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Search menu", text: $searchText)
                .padding(.horizontal)
            Text("ORDER FOR DELIVERY!")
                .padding(.horizontal)
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(category) {}
                        .buttonStyle(.bordered)
                }
            }
            .frame(maxWidth: .infinity)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dish.title!)
                                    .font(.headline)
                                    .fontWeight(.medium)
                                Text(dish.dishDescription!)
                                    .fontWeight(.light)
                                    .font(.caption)
                                Text("$\(dish.price!).99")
                                    .font(.caption)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                                .frame(width: 80, height: 80)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }.onAppear {
            getMenuData()
        }
    }

    func getMenuData() {
        PersistenceController.shared.clear()
        let apiAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: apiAddress)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                do {
                    let menuList = try JSONDecoder().decode(MenuList.self, from: data)
                    for dish in menuList.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.dishDescription = dish.dishDescription
                        newDish.price = dish.price
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                } catch {
                    print("Cannot decode API data.")
                }
            }
        }
        task.resume()
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }

    func buildPredicate() -> NSPredicate {
        if searchText == "" {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

#Preview {
    Menu()
}
