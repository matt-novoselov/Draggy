//
//  ImageNode.swift
//  SwiftUINodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI
import PhotosUI

struct ImageNode: View {
    @Binding var circlePosition: CGPoint
    var action: (() -> Void)?
    
    @State private var pickerItem: PhotosPickerItem?
    @Binding var diplayedImage: Image?
    
    var body: some View {
        let circleSize: CGFloat = 200
        
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
                
                VStack{
                    Text("Image Node")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    diplayedImage?
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
                }
                .onChange(of: pickerItem) {
                    Task {
                        diplayedImage = try await pickerItem?.loadTransferable(type: Image.self)
                    }
                }


            }
            .contextMenu(ContextMenu(menuItems: {
                Button("Delete"){
                    action?()
                }
            }))
            .position(circlePosition)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        circlePosition = value.location
                    }
            )
        }
        .frame(width: circleSize, height: circleSize)
    }
}
