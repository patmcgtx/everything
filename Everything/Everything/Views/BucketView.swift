//
//  BucketView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/24/24.
//

import Foundation
import SwiftUI

// TODO doc
struct BucketView: View {
    
    let bucket: Bucket
    
    var body: some View {
        Text(bucket.info)
    }
}
