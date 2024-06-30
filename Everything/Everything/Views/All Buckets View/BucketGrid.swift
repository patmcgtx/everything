//
//  BucketGrid.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/12/24.
//

import SwiftUI
import SwiftData
import WaterfallGrid

/// A grid / collection view of all filtered buckets
struct BucketGrid: View {
    
    // MARK: Persistence
    
    @Environment(\.modelContext) private var modelContext
    @Query private var buckets: [Bucket]

    // MARK: Search filter

    let filterText: String
    
    init(filterText: String) {

        self.filterText = filterText
        
        let predicate = Bucket.filterBucketsBy(text: filterText)
        _buckets = Query(filter: predicate, sort: \.title, order: .forward)
    }

    // MARK: Main view

    var body: some View {
        WaterfallGrid(self.buckets) { bucket in
            NavigationLink {
                BucketDetail(bucket: bucket)
            } label: {
                BucketGridItem(bucket: bucket)
            }
        }
//        .onDelete(perform: deleteItems)
    }
    
    // MARK: Helpers
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(buckets[index])
            }
        }
    }

    /// A view representing a bucket in a grid, ostensibly for navigation to that bucket.
    struct BucketGridItem : View {

        // MARK: Backing data
        
        let bucket: Bucket
        
        // MARK: Main view
        
        var body: some View {
            
            ZStack {
                if let photoData = bucket.photoData,
                   let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                }

                VStack {
                    Text(bucket.title)
                        .padding()
                }
            }
            .border(Color.black, width: 1)
            .padding()
        }
        
    }
    
}

