//
//  TestUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct BaseUINode: View {
    @Binding var nodePosition: CGPoint
    var customOverlay: AnyView?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.black, lineWidth: 5) // Adjust the color and line width as needed
                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white))
            
            customOverlay
                .padding()
        }
        .frame(width: 200, height: 200)
        .position(nodePosition)
        .gesture(
            DragGesture()
                .onChanged { value in
                    nodePosition = value.location
                }
        )
    }
}
