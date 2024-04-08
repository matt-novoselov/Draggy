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
    
    private let buttons: [(Node.Type, String, String)] = [
        (TextNode.self, "Text", "text.word.spacing"),
        (ImageNode.self, "Image", "photo.fill"),
        (ColorNode.self, "Color", "paintpalette.fill"),
        (OpacityNode.self, "Opacity", "rectangle.checkered"),
        (RotationNode.self, "Rotation", "arrow.clockwise"),
        (CornerRadiusNode.self, "Corner Radius", "viewfinder"),
        (ShadowNode.self, "Shadow", "shadow"),
    ]
    
    var body: some View {
        Menu {
            ForEach(buttons, id: \.1) { button in
                Button {
                    addNode(button.0)
                } label: {
                    Label(button.1, systemImage: button.2)
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
