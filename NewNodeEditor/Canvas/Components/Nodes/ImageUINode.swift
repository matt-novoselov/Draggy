//
//  ImageUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI
import PhotosUI

struct ImageUINode: View {
    var selectedNode: ImageNode
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var showingPhotoPicker: Bool = false
    
    var body: some View {
        Button(action: {showingPhotoPicker = true}){
            
            Rectangle()
                .fill(.clear)
                .aspectRatio(contentMode: .fit)
                .background(
                    selectedNode.value?
                        .resizable()
                        .scaledToFill()
                )
                .clipShape(Rectangle())
                .cornerRadius(10)
            
        }
        .photosPicker(isPresented: $showingPhotoPicker, selection: $pickerItem, matching: .images)
        .onChange(of: pickerItem) {
            Task {
                selectedNode.value = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}
