//
//  ImageNode.swift
//  SwiftUINodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageNode: View {
    @Binding var circlePosition: CGPoint
    var action: (() -> Void)?
    
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
