//
//  ItemDetail.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/20/24.
//

import Foundation
import SwiftUI

/// A view of an item's details
struct ItemDetail : View {

    // MARK: Backing date
    
    /// The item to display
    let itemToShow: Item
    
    /// Other associates to display with the main item
    let associatedItems: [Item]
    
    // MARK: Main content
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(self.associatedItems) { item in
                    Spacer()
                    VStack {
                        Text(item.title).fontWeight(.bold)
                        Text(item.about)
                    }
                    .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
    
}
