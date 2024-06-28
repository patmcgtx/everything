//
//  BucketDetail.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

/// The main view for a bucket, including bucket info and all contained items.
struct BucketDetail: View {
    
    // TODO patmcg Update bucket.lastViewed when this screen loads
    
    // MARK: Backing data
    
    let bucket: Bucket
    
    // MARK: Private state
    
    @State private var isItemPresented = false
    @State private var selectedItem: Item?
    
    // MARK: Main view
    
    var body: some View {
        VStack {
            Text(bucket.title)
            Text(bucket.about)
            if let items = bucket.items {
                List(items) { item in
                    // isHighlighted was added to force a state change and redraw when selectedItem changes
                    let isHighlighted = self.selectedItem == item
                    BucketItemRow(item: item, isHighlighted: isHighlighted, selectedItem: self.$selectedItem, isItemPresented: self.$isItemPresented)
                }
            }
        }
        .sheet(isPresented: self.$isItemPresented) {
            if let item = self.selectedItem {
                ItemDetail(itemToShow: item, associatedItems: self.bucket.items ?? [])
            } else {
                Text("No item selected")
            }
        }
    }
    
    struct BucketItemRow: View {
        
        let item: Item

        // isHighlighted was added to force a state change and redraw when selectedItem changes.
        let isHighlighted: Bool
        
        @Binding var selectedItem: Item?
        @Binding var isItemPresented: Bool
        
        var body: some View {
            Button(action: tappedItem) {
                let imageName = isHighlighted ? "star.fill" : "star"
                Label(item.title, systemImage: imageName)
            }
        }
        
        private func tappedItem() {
            self.selectedItem = item
            self.isItemPresented = true
        }
    }
    
    
}
