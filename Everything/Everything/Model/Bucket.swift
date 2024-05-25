//
//  Bucket.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/23/24.
//

import Foundation
import SwiftData

/// A bucket in the database, containing items.
@Model
final class Bucket: Identifiable {
    
    /// Title describing this bucket, e.g. "Coffee shops"
    var title: String {
        didSet {
            self.whenUpdated = Date()
        }
    }
    
    /// Markdown text briefly describing the bucket
    var info: String {
        didSet {
            self.whenUpdated = Date()
        }
    }
    
    /// You can star a bucket for favorite / priority viewing 
    var isStarred: Bool = false

    // MARK: Metadata
    
    @Attribute(.unique) var id: UUID = UUID()

    /// The timestamp for when this bucket was created
    var whenCreated: Date
    
    /// The timestamp for when this bucket was last updated
    var whenUpdated: Date

    /// The timestamp for when this bucket was last viewed
    var lastViewed: Date

    // MARK: Initializers
    
    init(title: String, info: String) {
        
        self.title = title
        self.info = info
        
        let now = Date()
        self.whenCreated = now
        self.whenUpdated = now
        self.lastViewed = now
    }
    
}
