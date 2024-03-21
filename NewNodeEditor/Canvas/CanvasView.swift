//
//  CanvasView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct CanvasView: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        
        ZStack{
            // Text Nodes
            ForEach(nodeData.textNodes) { selectedNode in
                BaseUINode(customOverlay: AnyView(TextUINode(selectedNode: selectedNode)), selectedNode: selectedNode)
            }
            
            // Image Nodes
            ForEach(nodeData.imageNodes) { selectedNode in
                BaseUINode(customOverlay: AnyView(ImageUINode(selectedNode: selectedNode)), selectedNode: selectedNode)
            }
            
            // Color Nodes
            ForEach(nodeData.colorNodes) { selectedNode in
                BaseUINode(customOverlay: AnyView(ColorUINode(selectedNode: selectedNode)), selectedNode: selectedNode)
            }
            
            // Opacity Nodes
            ForEach(nodeData.opacityNodes) { selectedNode in
                BaseUINode(customOverlay: AnyView(OpacityUINode(selectedNode: selectedNode)), selectedNode: selectedNode)
            }
            
            ForEach(nodeData.opacityNodes) { selectedNode in
                BaseUINode(customOverlay: AnyView(OpacityUINode(selectedNode: selectedNode)), selectedNode: selectedNode)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            LinkingView()
        }
        .background(.gray)
        
    }
}

#Preview {
    CanvasView()
        .environment(NodeData())
}
