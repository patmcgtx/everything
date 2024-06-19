//
//  AddItemForm.swift
//  Everything
//
//  Created by Patrick McGonigle on 6/15/24.
//

import SwiftUI
import SwiftData

/// Form that prompts the use to add an item
struct AddItemForm: View {
    
    // MARK: Persistence
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Bucket.title, order: .forward) private var allBuckets: [Bucket]
        
    // MARK: User input fields
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""
    @State private var bucketSelection = Set<UUID>()
    
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
                
                Section(header: Text("Buckets")) {
                    List(allBuckets) { bucket in
                        BucketSelectionRow(bucket: bucket, bucketSelection: self.$bucketSelection)
                    }
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
                        let selectedBuckets = self.allBuckets.filter {
                            self.bucketSelection.contains($0.id)
                        }
                        let newItem = Item(title: self.titleValue,
                                           about: self.aboutValue,
                                           buckets: selectedBuckets)
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
    
    /// Displays a bucket to select for an item
    struct BucketSelectionRow: View {
        
        /// The bucket to display in this row
        let bucket: Bucket
        
        /// Tracks whether *this* bucket row is selected in the UI
        @State var isSelected = false
        
        /// Collection of selected buckets to update on the main view
        @Binding var bucketSelection: Set<UUID>

        // MARK: Main content
        
        var body: some View {
            HStack {
                let isBucketSelected = self.bucketSelection.contains(self.bucket.id)
                Image(systemName: isBucketSelected ? "checkmark.circle" : "circle")
                Text(bucket.title)
            }
            // .onTapGesture does not work, requires simultaneousGesture
            .simultaneousGesture(TapGesture().onEnded {
                self.isSelected.toggle()
                if self.isSelected {
                    self.bucketSelection.insert(self.bucket.id)
                } else {
                    self.bucketSelection.remove(self.bucket.id)
                }
            })
        }
    }
    
}


