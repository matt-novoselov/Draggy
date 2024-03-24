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
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData

    @State private var isBeingDragged: Bool = false
    let cornerRadius: CGFloat = 25
    
    @State var selectedNode: Node
    var customOverlay: AnyView?
    
    @Binding var maxZIndex: Double
    @State private var selfZIndex: Double = 0
    @State private var showingAlert = false
    
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
                showingAlert=true
            }
        }
        .zIndex(isBeingDragged ? 10000.0 : selfZIndex)
        .position(selectedNode.position)
        .transition(.scale(0.0, anchor: selectedNodeAnchor()))
        .gesture(
            DragGesture()
                .onChanged { value in
                    selectedNode.position = value.location
                    
                    withAnimation{
                        isBeingDragged = true
                    }
                }
                .onEnded{ _ in 
                    updateZIndex()
                    
                    withAnimation{
                        isBeingDragged = false
                    }
                }
        )
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Do you want to delete this node?"),
                message: Text("You can't undo this action."),
                primaryButton: .cancel(),
                secondaryButton: .destructive(
                    Text("Delete"),
                    action: { nodeData.deleteNode(selectedNode) }
                )
            )
        }
    }
    
    func selectedNodeAnchor() -> UnitPoint {
        guard let canvasGeometry = canvasData.canvasGeometry else {
            return UnitPoint(x: 0.5, y: 0.5)
        }

        let x = selectedNode.position.x / canvasGeometry.size.width
        let y = selectedNode.position.y / canvasGeometry.size.height
        return UnitPoint(x: x, y: y)
    }

    
    private func updateZIndex(){
        if selfZIndex<maxZIndex{
            selfZIndex = maxZIndex+1
            maxZIndex = selfZIndex
        }
    }
}
