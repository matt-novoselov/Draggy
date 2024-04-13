//
//  ImageUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI
import PhotosUI

struct ImageUINode: View {
    
    @State var selectedNode: ImageNode
    @State private var pickerItem: PhotosPickerItem?
    @State private var showingPhotoPicker: Bool = false
    
    var body: some View {
        
        let image: Image = selectedNode.value as? Image ?? Image("placeholder")
        
        Button(action: {showingPhotoPicker = true}){

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
        .photosPicker(isPresented: $showingPhotoPicker, selection: $pickerItem, matching: .images)
        .onChange(of: pickerItem) {
            Task {
                selectedNode.value = try await pickerItem?.loadTransferable(type: Image.self) as Any
            }
        }
    }
}
