//
//  singleSearchButton.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

// Single button of the smart search
struct SingleSearchButton: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    // Load CanvasData from Environment
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    // Variable to dismiss currently presented sheet
    @Environment(\.dismiss) var dismiss
    
    // Currently selected searchButton
    var searchButton: ButtonItem
    
    var body: some View {
        
        // On click of the button, add new node of given type to the canvas
        Button(action: {addNode(searchButton.nodeType)}) {
            
            Label(
                title: {
                    // Display button's title
                    Text(searchButton.title)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.white)
                },
                icon: {
                    // Make all SF symbols the save size by overlaying them on top of the existing SF Symbol
                    Image(systemName: "circle")
                        .opacity(0)
                        .padding(.all, 4)
                        .background{
                            // Add rounded rectangle to the background
                            Color.white
                                .cornerRadius(5)
                                .opacity(0.1)
                        }
                        .overlay{
                            Image(systemName: searchButton.iconName)
                                .foregroundStyle(.gray)
                        }
                }
            )
            
        }
        
    }
    
    // Function to add new node of given type to the canvas
    private func addNode(_ nodeType: Node.Type) {
        // Get canvas geometry and size from canvasData
        guard let canvasGeometry = canvasData.canvasGeometry else { return }
        
        // Determine center of the canvas, so node will be spawned exactly in the middle
        let centerX = canvasGeometry.size.width / 2
        let centerY = canvasGeometry.size.height / 2
        
        // Add new node at determined position
        nodeData.addNode(nodeType, position: CGPoint(x: centerX, y: centerY))
        
        // Dismiss current sheet (Smart Search)
        dismiss()
    }
}

#Preview {
    SingleSearchButton(searchButton: ButtonListViewModel().buttons[0])
        .environment(NodeData())
        .environment(CanvasData())
}
