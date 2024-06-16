//
//  BucketDetailView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

/// The main view for a bucket, including bucket info and all contained items.
struct BucketDetailView: View {
    
    // TODO Update bucket.lastViewed when this screen loads

    // MARK: Incoming data
    
    let bucket: Bucket
    
    // MARK: Main view
    
    var body: some View {
        Text(bucket.about)
    }
}
