//
//  Item.swift
//  Everything
//
//  Created by Patrick McGonigle on 4/18/24.
//

import Foundation
import SwiftData

/// The original "default" item from 
@Model
final class ItemOrig {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

/// An item in the Everything database
@Model
final class Item: Identifiable {
            
    /// The title of the item, e.g. "Barton Springs Pool"
    var title: String
    
    /// Markdown text describing the item
    var content: String
    
    // MARK: Metadata

    /// Unique id
    @Attribute(.unique) var id: UUID = UUID()

    /// The timestamp for when this item was created
    var whenCreated: Date
    
    /// The timestamp for when this item was last updated
    var whenUpdated: Date
    
    // MARK: Initilizers

    init(title: String, content: String) {
        
        self.title = title
        self.content = content
        
        let now = Date()
        self.whenCreated = now
        self.whenUpdated = now
    }
}
