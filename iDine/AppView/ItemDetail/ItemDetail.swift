//
//  ItemDetail.swift
//  iDine
//
//  Created by Gareth Miller on 31/03/2020.
//  Copyright © 2020 Gareth Miller. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {

    var item: MenuItem

    @EnvironmentObject var order: Order
    @EnvironmentObject var favourite: Favourite

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()

            Button("Order this") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name),
                            displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action:
                    {
                        if self.favourite.isFavourite(item: self.item) {
                        self.favourite.remove(item: self.item)
                    } else {
                        self.favourite.add(item: self.item)
                    }
                }
                ) {
                    Image(systemName:
                        favourite.isFavourite(item: self.item) ? "star.fill" : "star")
            })
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favourite = Favourite()

    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(order)
                .environmentObject(favourite)
        }
    }
}
