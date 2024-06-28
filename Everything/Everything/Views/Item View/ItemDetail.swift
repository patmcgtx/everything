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
    
    /// Other associates to display with the main item
    let associatedItems: [Item]
    
    // MARK: Main content
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(self.associatedItems) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(.yellow)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            VStack {
                                Text("Selected: \(itemToShow.title)")
                                Text("Title: \(item.title)").fontWeight(.bold)
                                Text("About: \(item.about)")
                            }
                        }
                    }
                }
                .scrollTargetLayout()
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
}
