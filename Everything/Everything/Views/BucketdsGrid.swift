//
//  BucketdsGrid.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/12/24.
//

import SwiftUI
import SwiftData

struct BucketdsGrid: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var buckets: [Bucket]
    
    let filterText: String
    
    init(filterText: String) {

        self.filterText = filterText
        
        let predicate = Bucket.filterBucketsBy(text: filterText)
        _buckets = Query(filter: predicate, sort: \.title, order: .forward)
    }

    var body: some View {
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
