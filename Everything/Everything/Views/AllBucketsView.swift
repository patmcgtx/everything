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
    
    // MARK: Search
    
    @State private var searchText: String = ""
    
    // MARK: Modal presentation

    @State private var isAddBucketViewPresented: Bool = false

    // MARK: Main view

    var body: some View {
        
    NavigationSplitView {
        ScrollView {
            BucketdsGrid(filterText: self.searchText)
            .searchable(text: self.$searchText)
            .padding()
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
                Button(action: presentAddItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            ToolbarItem() {
                Button(action: presentAddBucket) {
                    Label("Add Bucket", systemImage: "folder.badge.plus")
                }
            }
        }
    } detail: {
            Text("Select an item")
        }
    }
    
    // MARK: Modal helpers
    
    private func presentAddBucket() {
        withAnimation {
            self.isAddBucketViewPresented = true
        }
    }

    private func presentAddItem() {
        withAnimation {
//            self.isAddItemSheetPresented = true
        }
    }

}
