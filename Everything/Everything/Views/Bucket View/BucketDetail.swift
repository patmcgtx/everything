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
            Text("Selected: \(self.selectedItem?.title ?? "None")")
            if let items = bucket.items {
                List(items) { item in
                    BucketItemRow(item: item, selectedItem: self.$selectedItem, isItemPresented: self.$isItemPresented)
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
        
        @Binding var selectedItem: Item?
        @Binding var isItemPresented: Bool
        
        var body: some View {
            Button(action: tappedItem) {
                Label(item.title, systemImage: "plus")
            }
        }
        
        private func tappedItem() {
//            self.selectedItem = Item(title: "", about: "")
            self.selectedItem = item
//            self.isItemPresented = true
        }
    }
    
    
}
