//
//  BucketsMainView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

/// A view of all the buckets, possibly filtered.
struct BucketsMainView: View {
    
    @Environment(\.modelContext) private var modelContext

    // MARK: Search
    
    @State private var searchText: String = ""
    
    // MARK: Modal presentation

    @State private var isAddBucketViewPresented: Bool = false
    @State private var isAddItemViewPresented: Bool = false

    // MARK: Main view

    var body: some View {
        
    NavigationSplitView {
        ScrollView {
            BucketGrid(filterText: self.searchText)
            .searchable(text: self.$searchText)
            .padding()
        }
        .sheet(isPresented: self.$isAddBucketViewPresented, content: {
            AddBucketForm(isPresented: self.$isAddBucketViewPresented)
        })
        .sheet(isPresented: self.$isAddItemViewPresented, content: {
            AddItemForm(modelContext: modelContext, isPresented: self.$isAddItemViewPresented)
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
            self.isAddItemViewPresented = true
        }
    }

}
