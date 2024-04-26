//
//  ImageUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI
import PhotosUI

// ImageUINode is displayed in the canvas and allows the user to select an image
struct ImageUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: ImageNode
    
    // State variables for managing the photo picker
    @State private var pickerItem: PhotosPickerItem?
    
    // Property that controls the visibility of the photo picker
    @State private var showingPhotoPicker: Bool = false
    
    var body: some View {
        
        // Retrieves the image associated with the selected node or uses a placeholder if not available
        let image: Image = selectedNode.value as? Image ?? Image("placeholder")
        
        // Button to trigger the photo picker
        Button(action: { showingPhotoPicker = true }) {
            
            Rectangle()
                .fill(.clear)
                .aspectRatio(contentMode: .fit)
                .background(
                    image
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(Rectangle())
                .cornerRadius(10)
            
        }
        // Integrates the PhotosPicker with the SwiftUI view hierarchy
        .photosPicker(isPresented: $showingPhotoPicker, selection: $pickerItem, matching: .images)
        
        // Load the selected image and assigns it to the selected node's value
        .onChange(of: pickerItem) {
            Task {
                selectedNode.value = try await pickerItem?.loadTransferable(type: Image.self) as Any
            }
        }
    }
}
