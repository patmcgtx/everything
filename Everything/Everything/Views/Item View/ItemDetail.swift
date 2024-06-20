//
//  ItemDetail.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/20/24.
//

import Foundation
import SwiftUI

/// A view of an item's details
struct ItemDetail : View {

    // MARK: Backing date
    
    let item: Item
    
    // MARK: Main content
    
    var body: some View {
        Text(self.item.title).fontWeight(.bold)
        Text(self.item.about)
    }
    
}
