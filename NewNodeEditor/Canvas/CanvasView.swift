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
            
            ForEach(nodeData.nodes.indices, id: \.self){ index in
                BaseUINode(
                    selectedNode: nodeData.nodes[index],
                    customOverlay: AnyView(createUINode(node: nodeData.nodes[index]))
                )
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
        .overlay {
            LinkingView()
        }
        
    }
    
    // MARK: - Create UI Node
    func createUINode(node: any NodeObject) -> some View {
        switch node {
        case let textNode as TextNode:
            return AnyView(TextUINode(selectedNode: textNode))
        case let imageNode as ImageNode:
            return AnyView(ImageUINode(selectedNode: imageNode))
        case let colorNode as ColorNode:
            return AnyView(ColorUINode(selectedNode: colorNode))
        case let opacityNode as OpacityNode:
            return AnyView(OpacityUINode(selectedNode: opacityNode))
        default:
            return AnyView(EmptyView())
        }
    }
    
}

#Preview {
    CanvasView()
        .environment(NodeData())
}
