//
//  TestUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

// This is the basic draggable shape that is displayed on the background of each node
struct BaseUINode: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    // Load CanvasData from Environment
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    // Define corner radius of the Node
    let cornerRadius: CGFloat = 25
    
    // Property that controls if the node is currently being dragged
    @State private var isBeingDragged: Bool = false
    
    // Selected node that should be displayed
    @State var selectedNode: Node
    // All nodes views are only previewed through overlaying them on top of the BaseUINode
    var customOverlay: AnyView?
    
    // Determine the maximum z index, that any existing node in the canvas has
    @Binding var maxZIndex: Double
    
    // Property that controls the z index assigned to the individual node
    @State private var selfZIndex: Double = 0

    // Drag offset is used while the node is being dragged to create seamless path
    @GestureState private var dragOffset = CGSize.zero
    
    // The node's position on the canvas
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
            
            // All nodes views are only previewed through overlaying them on top of the BaseUINode
            customOverlay
                .padding(.all, 35)
                .clipped()
        }
        .overlay{
            BezierPathInteractive(selfNode: selectedNode)
                .offset(x: 100) // The path is offset by 100px to the right
        }
        .frame(width: 200, height: 200)
        .contextMenu{
            // MARK: The Duplicate button is not Duplicating property of the node
//            // Duplicate button in context menu
//            Button("Duplicate", systemImage: "rectangle.portrait.on.rectangle.portrait") {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
//                    nodeData.duplicateNode(selectedNode) // Duplicate the selected node
//                }
//            }
            
            // Delete button in context menu
            Button("Delete", systemImage: "trash", role: .destructive) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                    nodeData.deleteNode(selectedNode) // Delete the selected node
                }
            }
        }
        .zIndex(isBeingDragged ? 10000.0 : selfZIndex) // Set zIndex based on whether the node is being dragged
        .scaleEffect(isBeingDragged ? 1.1 : 1.0) // Apply scaling effect when the node is being dragged
        .transition(.scale(0.0, anchor: selectedNodeAnchor())) // Apply transition when the node is being spawned
        .position(position) // Position the node on the canvas
        .offset(x: dragOffset.width, y: dragOffset.height) // Apply drag offset to the node
        .gesture(
            DragGesture()
                .updating($dragOffset, body: { (value, state, transaction) in
                    state = value.translation
                    position = value.location
                    
                    // Update node position
                    selectedNode.position = CGPoint(x: position.x + dragOffset.width, y: position.y + dragOffset.height)
                })
                .onChanged{ value in
                    withAnimation {
                        // Indicate that the node is being dragged
                        isBeingDragged = true
                    }
                }
                .onEnded { value in
                    self.position.x += value.translation.width
                    self.position.y += value.translation.height
                    
                    // Update node position after dragging
                    selectedNode.position = position
                    
                    // Update the z-index of the node
                    updateZIndex()
                    
                    withAnimation {
                        // Indicate that the dragging has ended
                        isBeingDragged = false
                    }
                }
        )
        .onAppear(){
            // Set initial position of the node
            self.position = selectedNode.position
            
            // Set initial z-index of the node
            self.selfZIndex = maxZIndex + 1
        }
    }
    
    // Function to determine the anchor point of the selected node based on the canvas size
    func selectedNodeAnchor() -> UnitPoint {
        guard let canvasGeometry = canvasData.canvasGeometry else {
            return UnitPoint(x: 0.5, y: 0.5)
        }
        
        let x = selectedNode.position.x / canvasGeometry.size.width
        let y = selectedNode.position.y / canvasGeometry.size.height
        return UnitPoint(x: x, y: y)
    }
    
    // Function to update the z-index of the node
    private func updateZIndex(){
        if selfZIndex<maxZIndex{
            selfZIndex = maxZIndex+1
            maxZIndex = selfZIndex
        }
    }
}
