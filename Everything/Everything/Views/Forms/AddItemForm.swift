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
                        BucketSelectionRow(bucket: bucket)
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
        
        @Bindable var bucket: Bucket
        
        // MARK: Main content
        
        var body: some View {
            HStack {
                Image(systemName: bucket.isSelected ? "checkmark.circle" : "circle")
                Text(bucket.title)
            }
            // .onTapGesture does not work, requires simultaneousGesture
            .simultaneousGesture(TapGesture().onEnded {
                print("Gesture on VStack.")
                self.bucket.isSelected.toggle()
            })
        }
    }
    
}


