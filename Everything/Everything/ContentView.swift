//
//  ContentView.swift
//  Everything
//
//  Created by Patrick McGonigle on 4/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var buckets: [Bucket]

    var body: some View {
        NavigationSplitView {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(buckets[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
