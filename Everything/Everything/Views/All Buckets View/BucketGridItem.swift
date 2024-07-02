//
//  BucketGridItem.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/30/24.
//

import Foundation
import SwiftUI

/// A view representing a bucket in a grid, ostensibly for navigation to that bucket.
struct BucketGridItem : View {

    // MARK: Backing data
    
    let bucket: Bucket
    
    // MARK: Main view
    
    var body: some View {
        
        let textBg = Color.white.opacity(0.8)
        
        ZStack {
            if let photoData = bucket.photoData,
               let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                // These keep the image from expanding full-size
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            }

            VStack(alignment: .leading) {
                if let itemCount = self.bucket.items?.count {
                    Text(String(itemCount))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.all, 6.0)
                        .background { textBg }
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Text(bucket.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.all, 6.0)
                    .frame(maxWidth: .infinity)
                    .background { textBg }
            }
             // This keeps the view form expanding vertically beyond the image
            .layoutPriority(-1)
        }
        .border(Color.black, width: 0)
        .cornerRadius(18)
        .padding()
        .frame(width: 200)
    }
    
}

struct BucketGridItemPreview : PreviewProvider {
        
    static var previews: some View {
        let uiImage = UIImage(named: "wolfwalkers")
        let bucket = Bucket(title: "Bucket", about: "About", photoData: uiImage?.pngData())
        BucketGridItem(bucket: bucket)
    }
}

