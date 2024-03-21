//
//  TestUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct BaseUINode: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData

    var customOverlay: AnyView?
    
    @State private var scale: CGFloat = 1.0
    @State private var shadowOpacity: CGFloat = 0.0

    @State var selectedNode: any Node
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color.black, lineWidth: 5) // Adjust the color and line width as needed
                .background(RoundedRectangle(cornerRadius: 25.0).foregroundColor(.white))
                .shadow(color: .black.opacity(shadowOpacity), radius: 15)
            
            customOverlay
                .padding()
            
            BezierPath2(selfNode: selectedNode)
        }
        .frame(width: 200, height: 200)
        .contextMenu{
            Button("Delete") {
                nodeData.deleteNode(selectedNode)
            }
        }
        .position(selectedNode.position)
        .scaleEffect(scale)
        .gesture(
            DragGesture()
                .onChanged { value in
                    selectedNode.position = value.location
                    
                    withAnimation{
                        scale = 1.1
                        shadowOpacity = 0.2
                    }
                }
                .onEnded{ _ in 
                    withAnimation{
                        scale = 1.0
                        shadowOpacity = 0.0
                    }
                }
        )
    }
}
