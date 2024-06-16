//
//  AddItemForm.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/15/24.
//

import SwiftUI

struct AddItemForm: View {
    
    // MARK: Persistence
    
    @Environment(\.modelContext) private var modelContext
    
    // MARK: User input fields
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""
    
    // MARK: Field focus
    
    enum Field {
        case title, about
    }
    
    @FocusState private var focus: Field?
    
    // MARK: Modal presentation management
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basics")) {
                    TextField("Title", text: self.$titleValue)
                        .focused(self.$focus, equals: .title)
                    TextField("About", text: self.$aboutValue)
                        .focused(self.$focus, equals: .about)
                }
                
                // TODO Add image selection
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
            .onAppear {
                self.focus = .title
            }
        }
    }
    
}
