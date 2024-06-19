//
//  BucketGridItem.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

/// A view representing a bucket in a grid, ostensibly for navigation to that bucket.
struct BucketGridItem : View {

    // MARK: Backing data
    
    let bucket: Bucket
    
    // MARK: Main view
    
    var body: some View {
        
        VStack {
            if let photoData = bucket.photoData,
               let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 200)
            }

            Text(bucket.title)
                .padding()
        }
        .border(Color.black, width: 1)
        .padding()
    }
    
}

