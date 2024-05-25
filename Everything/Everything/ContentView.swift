//
//  ContentView.swift
//  Everything
//
//  Created by Patrick McGonigle on 4/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        
        // TODO Add a nav header and maybe tab bar 
        
        // TODO Filter by bucket name
        
        // TODO Show convenience groupings such as "Starred", "Recently Viewed", etc.
        
        // TODO Be able to switch between different views here, i.e. grid vs. list (lower priority)

        AllBucketsGridView()
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
