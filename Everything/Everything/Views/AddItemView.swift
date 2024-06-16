//
//  AddItemView.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/15/24.
//

import SwiftUI

struct AddItemView: View {
    
    // MARK: Persistence
    
    @Environment(\.modelContext) private var modelContext
    
    // MARK: User input fields
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""
    
    // MARK: Modal presentation management
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basics")) {
                    TextField("Title", text: self.$titleValue)
                    TextField("About", text: self.$aboutValue)
                }
            }
            .navigationTitle("New Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        self.isPresented = false
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        let newItem = Item(title: self.titleValue,
                                           about: self.aboutValue)
                        self.modelContext.insert(newItem)
                        self.isPresented = false
                    }
                }
            }
        }
    }
    
}
