//
//  ItemDetail.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/20/24.
//

import Foundation
import SwiftUI

/// A view of an item's details along with associated items
struct ItemDetail : View {
    
    // MARK: Backing date
    
    /// The item to display
    let itemToShow: Item
    
    // TODO Eventually turn the item array into a @Query; maybe pass in a Predicate.
    //      This is for efficiency (don't have to load all items into memory)
    //      as well as to display *any* list of items, however they are filtered
    //      and sorted from the Everything tab, a bucker, tags, whatever.

    /// Other associates to display alongside the main item
    let associatedItems: [Item]
    
    // MARK: Main content
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollReader in
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(self.associatedItems) { item in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.yellow)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                VStack {
                                    Text("Title: \(item.title)").fontWeight(.bold)
                                    Text("About: \(item.about)")
                                }
                                .id(item.id)
                            }
                        }
                    }
                }
                .onAppear() {
                    // TODO This delay is hacky, and I don't love it.
                    // Without the delay, it does not scroll to the selected item.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        scrollReader.scrollTo(itemToShow.id, anchor: .center)
                    }
                }
                .scrollTargetLayout()
            }
            // TODO Ideally we use defaultScrollAnchor to auto-scroll to the selected item,
            //      but so fsr I can't get it to work for a specific item, so the hack ^ above.
//            .defaultScrollAnchor(.center)
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
}
