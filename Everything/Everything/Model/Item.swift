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
    
    // MARK: User-facing data
    
    /// The title of the item, e.g. "Barton Springs Pool"
    var title: String {
        didSet {
            self.whenUpdated = Date()
        }
    }

    /// Markdown text describing the item
    var about: String {
        didSet {
            self.whenUpdated = Date()
        }
    }

    /// You can star an item  for favorite / priority viewing
    var isStarred: Bool = false {
        didSet {
            self.whenUpdated = Date()
        }
    }

    // MARK: Relationships
    // Note that this relationships have to be optional and cannot be set on init
    
    var buckets: [Bucket]?
    
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
        
        let now = Date()
        self.whenCreated = now
        self.whenUpdated = now
    }
}

extension Item {
    
    /// Encapsulates Item creation logic with buckets, etc. options
    static func createItem(using context: ModelContext,
                    title: String,
                    about: String,
                    buckets: [Bucket]) {
        let item = Item(title: title, about: about)
        item.buckets = buckets
        context.insert(item)
    }
    
}
