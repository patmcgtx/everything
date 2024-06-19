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
    var about: String {
        didSet {
            self.whenUpdated = Date()
        }
    }
    
    /// Relationships
    var items = [Item]()

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

    /// Cover photo
    var photoData: Data?
    
    // MARK: Transient properties
    
    /// Used temporarily for bucket selection
    var isSelected = false // TODO patmcg make transient?  Seems to break AddItemForm UI updates, though.
    
    // MARK: Initializers
    
    init(title: String, about: String, photoData: Data? = nil) {
        
        self.title = title
        self.about = about
        self.photoData = photoData
        
        let now = Date()
        self.whenCreated = now
        self.whenUpdated = now
        self.lastViewed = now
    }
    
}

extension Bucket {
    
    /// A filter for bucket searches
    static func filterBucketsBy(text searchText: String) -> Predicate<Bucket> {
        return #Predicate<Bucket> { bucket in
            (searchText.isEmpty || bucket.title.contains(searchText))
        }
    }

}
