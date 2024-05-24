//
//  ItemOrig.swift
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

