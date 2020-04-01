//
//  Favourites.swift
//  iDine
//
//  Created by Gareth Miller on 01/04/2020.
//  Copyright © 2020 Gareth Miller. All rights reserved.
//

import SwiftUI

struct FavouritesView: View {

    @EnvironmentObject var favourite: Favourite
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favourite.items) { item in
                    ItemRow(item: item)
                }
                .onDelete(perform: deleteItems)
            }
                .navigationBarTitle("Favourites")
            .navigationBarItems(trailing: EditButton())
        }
        .listStyle(GroupedListStyle())
    }

    func deleteItems(at offsets: IndexSet) {
        favourite.items.remove(atOffsets: offsets)
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
