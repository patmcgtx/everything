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
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresented: Bool
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: self.$titleValue)
                }
                Section(header: Text("About")) {
                    TextField("About", text: self.$aboutValue)
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
        }
    }
}
