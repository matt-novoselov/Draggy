//
//  ImageUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI
import PhotosUI

struct ImageUINode: View {
    @Binding var selectedNode: ImageNode
    
    @State private var pickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack{
            Text("Image")
                .fontWeight(.bold)
            
            selectedNode.image?
                .resizable()
                .scaledToFit()
                .padding()
            
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                .onChange(of: pickerItem) {
                    Task {
                        selectedNode.image = try await pickerItem?.loadTransferable(type: Image.self)
                    }
                }

        }
    }
}
