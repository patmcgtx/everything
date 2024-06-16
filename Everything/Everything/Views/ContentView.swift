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
        BucketsMainView()
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
