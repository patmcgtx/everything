//
//  Item.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/23/24.
//

import Foundation
import SwiftData

/// A bucket item in the database.
@Model
final class Item: Identifiable {
            
    /// The title of the item, e.g. "Barton Springs Pool"
    var title: String
    
    /// Markdown text describing the item
    var about: String
    
    /// Relationships
    var buckets: [Bucket]? // Note that this relationship has to be optional
    
    // MARK: Metadata

    @Attribute(.unique) var id: UUID = UUID()

    /// The timestamp for when this item was created
    var whenCreated: Date
    
    /// The timestamp for when this item was last updated
    var whenUpdated: Date
    
    // MARK: Initializers

    init(title: String, about: String) {
        
        self.title = title
        self.about = about
        
        // Note that buckers cannot be set during the initializer

        let now = Date()
        self.whenCreated = now
        self.whenUpdated = now
    }
}
