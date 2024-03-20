//
//  CanvasView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct CanvasView: View {
    @EnvironmentObject var nodeData: NodeData
    
    var body: some View {
        
        ZStack{
            // Text Nodes
            ForEach(nodeData.textNodes.indices, id: \.self) { index in
                BaseUINode(nodePosition: $nodeData.textNodes[index].position, customOverlay: AnyView(TextUINode(selectedNode: $nodeData.textNodes[index])))
            }
            
            // Image Nodes
            ForEach(nodeData.imageNodes.indices, id: \.self) { index in
                BaseUINode(nodePosition: $nodeData.imageNodes[index].position, customOverlay: AnyView(ImageUINode(selectedNode: $nodeData.imageNodes[index])))
            }
            
            // Color Nodes
            ForEach(nodeData.colorNodes.indices, id: \.self) { index in
                BaseUINode(nodePosition: $nodeData.colorNodes[index].position, customOverlay: AnyView(ColorUINode(selectedNode: $nodeData.colorNodes[index])))
            }
            
            // Opacity Nodes
            ForEach(nodeData.opacityNodes.indices, id: \.self) { index in
                BaseUINode(nodePosition: $nodeData.opacityNodes[index].position, customOverlay: AnyView(OpacityUINode(selectedNode: $nodeData.opacityNodes[index])))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinkingView()
        }
        .background(.gray)
        
    }
}

#Preview {
    CanvasView()
        .environmentObject(NodeData())
}
