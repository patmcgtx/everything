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
        
        // TODO Be able to switch between different views here, i.e. grid vs. list
        
        // TODO Be able to filter by bucket name
        
        // TODO Show convenience groupings such as "Starred", "Recently Viewed", etc.
        
        AllBucketsGridView()
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
