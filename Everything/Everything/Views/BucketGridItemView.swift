//
//  BucketGridItemView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

/// The view representing a bucket in a grid, ostensibly for navigation to that bucket.
struct BucketGridItemView : View {

    let bucket: Bucket
    
    var body: some View {
        Text(bucket.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .padding()
            .border(Color.blue, width: 1)
    }
    
}

