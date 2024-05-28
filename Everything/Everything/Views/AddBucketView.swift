//
//  AddBucketView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/25/24.
//

import Foundation
import SwiftUI
import SwiftData

struct AddBucketView: View {
    
    // Persistence
    
    @Environment(\.modelContext) private var modelContext

    // Model management
    
    @Binding var isPresented: Bool
    
    // Internal state
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""
    
    // Field focus
    
    enum Field {
        case title, about
    }
    
    @FocusState private var focus: Field?

    // Presentation
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: self.$titleValue)
                        .focused(self.$focus, equals: .title)
                }
                
                Section(header: Text("About")) {
                    TextField("About", text: self.$aboutValue)
                        .focused(self.$focus, equals: .about)
                }
            }
            .navigationTitle("New Bucket")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        self.isPresented = false
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        let newBucket = Bucket(title: self.titleValue, about: self.aboutValue)
                        modelContext.insert(newBucket)
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
