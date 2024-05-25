//
//  BucketView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

/// The main view for a bucket, including bucket info and all contained items.
struct BucketView: View {
    
    let bucket: Bucket
    
    // TODO Update bucket.lastViewed when this screen loads
    
    var body: some View {
        Text(bucket.info)
    }
}
