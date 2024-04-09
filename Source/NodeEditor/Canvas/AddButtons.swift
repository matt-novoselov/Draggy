//
//  AddButtons.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct AddButtons: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    let buttonListViewModel = ButtonListViewModel().buttons
    
    var body: some View {
        Menu {
            ForEach(buttonListViewModel) { button in
                Button {
                    addNode(button.nodeType)
                } label: {
                    Label(button.title, systemImage: button.iconName)
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    private func addNode(_ nodeType: Node.Type) {
        guard let canvasGeometry = canvasData.canvasGeometry else { return }
        
        let centerX = canvasGeometry.size.width / 2
        let centerY = canvasGeometry.size.height / 2
        
        withAnimation {
            nodeData.nodes.append(nodeType.init(position: CGPoint(x: centerX, y: centerY)))
        }
    }
}
