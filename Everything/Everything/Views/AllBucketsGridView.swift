//
//  BucketGridView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

/// A grid representation of all buckets.
struct AllBucketsGridView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var buckets: [Bucket]

    var body: some View {
        
    NavigationSplitView {
        ScrollView {
            let gridItemSpec = GridItem(.adaptive(minimum: 80, maximum: .greatestFiniteMagnitude))
            LazyVGrid(columns: [gridItemSpec]) {
                ForEach(buckets) { bucket in
                    NavigationLink {
                        BucketView(bucket: bucket)
                    } label: {
                        BucketGridItemView(bucket: bucket)
                    }
                }
                .onDelete(perform: deleteItems)
            }.padding()
        }
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
#endif
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            // TODO Populate with user input
            let newBucket = Bucket(title: "Bucket title", info: "Bucket info")
            modelContext.insert(newBucket)
        }
    }

    // TODO Handle bucket deletions
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(buckets[index])
            }
        }
    }

}

