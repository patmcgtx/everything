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
    //                    let newBucket = Bucket(title: "Some bucket", about: "About a bucket")
    //                    modelContext.insert(newBucket)
    
    @Binding var isPresented: Bool

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    Text("Title")
                }
                Section(header: Text("About")) {
                    Text("About")
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
                    Button("Done") {}
                }
            }
        }
    }
}
