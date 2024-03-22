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

    @State private var isBeingDragged: Bool = false
    let cornerRadius: CGFloat = 25
    
    @State var selectedNode: Node
    var customOverlay: AnyView?
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.black, lineWidth: 5)
                .background(Color.white.cornerRadius(cornerRadius))
                .shadow(color: .black.opacity(isBeingDragged ? 0.2 : 0), radius: 15)
            
            customOverlay
                .padding(.all, 30)
            
            BezierPathInteractable(selfNode: selectedNode)
        }
        .frame(width: 200, height: 200)
        .contextMenu{
            Button("Delete") {
                nodeData.deleteNode(selectedNode)
            }
        }
        .zIndex(isBeingDragged ? 1 : 0)
        .scaleEffect(isBeingDragged ? 1.1 : 1.0)
        .position(selectedNode.position)
        .transition(.scale)
        .gesture(
            DragGesture()
                .onChanged { value in
                    selectedNode.position = value.location
                    
                    withAnimation{
                        isBeingDragged = true
                    }
                }
                .onEnded{ _ in 
                    withAnimation{
                        isBeingDragged = false
                    }
                }
        )
    }
}
