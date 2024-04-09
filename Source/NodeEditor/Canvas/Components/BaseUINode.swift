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

    @GestureState private var dragOffset = CGSize.zero
    @State private var position: CGPoint = .zero
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.nodeStroke, lineWidth: 8)
                .background (
                    BlurView(style: .regular, color: .nodeBackground)
                        .clipShape(.rect(cornerRadius: cornerRadius))
                )
                .shadow(color: .black.opacity(isBeingDragged ? 0.2 : 0), radius: 15)
            
            customOverlay
                .padding(.all, 35)
                .clipped()
        }
        .overlay{
            BezierPathInteractable(selfNode: selectedNode)
                .offset(x: 100)
        }
        .frame(width: 200, height: 200)
        .contextMenu{
            Button("Delete") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                    nodeData.deleteNode(selectedNode)
                }
            }
        }
        .zIndex(isBeingDragged ? 10000.0 : selfZIndex)
        .scaleEffect(isBeingDragged ? 1.1 : 1.0)
        .transition(.scale(0.0, anchor: selectedNodeAnchor()))
        .position(position)
        .offset(x: dragOffset.width, y: dragOffset.height)
        .gesture(
            DragGesture()
                .updating($dragOffset, body: { (value, state, transaction) in
                    state = value.translation
                    position = value.location
                    
                    selectedNode.position = CGPoint(x: position.x + dragOffset.width, y: position.y + dragOffset.height)
                })
                .onChanged{ value in
                    withAnimation {
                        isBeingDragged = true
                    }
                }
                .onEnded { value in
                    self.position.x += value.translation.width
                    self.position.y += value.translation.height
                    
                    selectedNode.position = position

                    updateZIndex()
                    
                    withAnimation {
                        isBeingDragged = false
                    }
                }
        )
        .onAppear(){
            self.position = selectedNode.position
            self.selfZIndex = maxZIndex + 1
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
