//
//  PreviewView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct PreviewView: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {

        VStack{
            ForEach(nodeData.nodes.indices, id: \.self){ index in
                createUIElement(node: nodeData.nodes[index])
            }
        }
        .frame(width: 300)
        
    }
    
    func createUIElement(node: any Node) -> some View {
        switch node {
        case let textNode as TextNode:
            return AnyView(TextUIElement(selectedNode: textNode))
        case let imageNode as ImageNode:
            return AnyView(ImageUIElement(selectedNode: imageNode))
        default:
            return AnyView(EmptyView())
        }
    }
}

#Preview {
    PreviewView()
        .environment(NodeData())
}
