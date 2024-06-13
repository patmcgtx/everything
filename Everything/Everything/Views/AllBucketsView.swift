//
//  BucketGridView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

/// A view of all the buckets, possibly filtered.
struct AllBucketsView: View {
    
    // MARK: Persistence / queries
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Bucket.title, order: .forward) private var buckets: [Bucket]
    
    // MARK: Modal states

    @State private var isAddBucketViewPresented: Bool = false

    // MARK: Main view

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
        .sheet(isPresented: $isAddBucketViewPresented, content: {
            AddBucketView(isPresented: $isAddBucketViewPresented)
        })
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
#endif
            ToolbarItem(placement: .topBarLeading) {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            ToolbarItem() {
                Button(action: addBucket) {
                    Label("Add Bucket", systemImage: "folder.badge.plus")
                }
            }
        }
    } detail: {
            Text("Select an item")
        }
    }
    
    private func addBucket() {
        withAnimation {
            self.isAddBucketViewPresented = true
        }
    }

    private func addItem() {
        withAnimation {
//            self.isAddItemSheetPresented = true
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(buckets[index])
            }
        }
    }

}

