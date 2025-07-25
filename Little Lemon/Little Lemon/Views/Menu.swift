//
//  Menu.swift
//  Little Lemon
//
//  Created by Daniel Shapiro on 7/20/25.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""

    var body: some View {
        VStack(alignment: .leading) {
            Header()
            Hero()
            TextField("Search menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            Text("\(dish.title!) \(dish.price!)")
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
                        newDish.price = dish.price
                        newDish.image = dish.image
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
