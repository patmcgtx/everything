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

    // MARK: Incoming data
    
    let bucket: Bucket
    
    // MARK: Main view
    
    var body: some View {
        ZStack {

            if let photoData = bucket.photoData,
               let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }

            Text(bucket.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .border(Color.blue, width: 1)
        }
    }
    
}

