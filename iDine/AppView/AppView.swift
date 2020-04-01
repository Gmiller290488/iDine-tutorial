//
//  AppView.swift
//  iDine
//
//  Created by Gareth Miller on 31/03/2020.
//  Copyright © 2020 Gareth Miller. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
            FavouritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        AppView().environmentObject(order)
    }
}
