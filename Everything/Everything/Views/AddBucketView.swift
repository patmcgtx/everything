//
//  AddBucketView.swift
//  Everything
//
//  Created by Patrick McGonigle on 5/25/24.
//

import Foundation
import SwiftUI
import SwiftData
import PhotosUI

struct AddBucketView: View {
    
    // Persistence
    
    @Environment(\.modelContext) private var modelContext

    // Modal presentation management
    
    @Binding var isPresented: Bool
    
    // Internal state
    
    @State private var titleValue: String = ""
    @State private var aboutValue: String = ""
    
    // Field focus
    
    enum Field {
        case title, about
    }
    
    @FocusState private var focus: Field?
    
    // Photo picker
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?

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
                
                Section(header: Text("Thumbnail")) {
                    PhotosPicker(selection: $photosPickerItem, matching: .images) {
                        Label("Select Photo", systemImage: "photo")
                    }
                }
                
                if let selectedPhotoData,
                   let uiImage = UIImage(data: selectedPhotoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .cornerRadius(10)
                } else {
                    Image(systemName: "photo")
                        .foregroundColor(.accentColor)
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
                        let newBucket = Bucket(title: self.titleValue, 
                                               about: self.aboutValue,
                                               photoData: self.selectedPhotoData)
                        modelContext.insert(newBucket)
                        self.isPresented = false
                    }
                }
            }
            .onAppear {
                self.focus = .title
            }
        }
        .onChange(of: photosPickerItem) {
            guard let photosPickerItem else {
                return
            }
            Task {
                await updatedPhotosPickerItem(with: photosPickerItem)
            }
        }
    }
    
    // MARK: Helpers
    
    private func updatedPhotosPickerItem(with item: PhotosPickerItem) async {
        if let photoData = try? await item.loadTransferable(type: Data.self) {
            self.selectedPhotoData = photoData
        }
    }
    
}
