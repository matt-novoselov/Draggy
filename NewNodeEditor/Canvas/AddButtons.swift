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
    
    var body: some View {
        HStack {
            Group{
                Button("Add text node") {
                    addNode(nodeType: TextNode.self)
                }
                
                Button("Add image node") {
                    addNode(nodeType: ImageNode.self)
                }
                
                Button("Add color node") {
                    addNode(nodeType: ColorNode.self)
                }
                
                Button("Add opacity node") {
                    addNode(nodeType: OpacityNode.self)
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
    }
    
    func addNode(nodeType: Node.Type){
        withAnimation{
            let centerX = (canvasData.canvasGeometry?.size.width ?? 0) / 2
            let centerY = (canvasData.canvasGeometry?.size.height ?? 0) / 2
            
            nodeData.nodes.append(
                nodeType.init(position: CGPoint(x: centerX, y: centerY))
            )
        }
    }
}