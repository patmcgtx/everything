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
    
    // MARK: Main view
    
    var body: some View {
        VStack {
            Text(bucket.title)
            Text(bucket.about)
            if let items = bucket.items {
                List(items) { item in
                    Text(item.title)
                }
            }
        }
    }
}
