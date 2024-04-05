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
        
        Menu {
            Group{
                Button {
                    addNode(TextNode.self)
                } label: {
                    Label("Text", systemImage: "text.alignleft")
                }
                
                Button {
                    addNode(ImageNode.self)
                } label: {
                    Label("Image", systemImage: "photo.fill")
                }
                
                Button {
                    addNode(ColorNode.self)
                } label: {
                    Label("Color", systemImage: "circle.hexagongrid.fill")
                }
                
                Button {
                    addNode(OpacityNode.self)
                } label: {
                    Label("Opacity", systemImage: "rectangle.checkered")
                }
                
                Button {
                    addNode(RotationNode.self)
                } label: {
                    Label("Rotation", systemImage: "arrow.clockwise")
                }
                
//                Button {
//                    addNode(CornerRadiusNode.self)
//                } label: {
//                    Label("Corner Radius", systemImage: "viewfinder")
//                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    func addNode(_ nodeType: Node.Type){
        withAnimation{
            let centerX = (canvasData.canvasGeometry?.size.width ?? 0) / 2
            let centerY = (canvasData.canvasGeometry?.size.height ?? 0) / 2
            
            nodeData.nodes.append(
                nodeType.init(position: CGPoint(x: centerX, y: centerY))
            )
        }
    }
}
