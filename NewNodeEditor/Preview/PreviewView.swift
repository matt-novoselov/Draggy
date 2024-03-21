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
            // Text Nodes
            ForEach(nodeData.textNodes) { selectedNode in
                TextUIElement(selectedNode: selectedNode)
            }
            
            // Text Nodes
            ForEach(nodeData.imageNodes) { selectedNode in
                ImageUIElement(selectedNode: selectedNode)
            }
        }
        .frame(width: 300)
        
    }
}

#Preview {
    PreviewView()
        .environment(NodeData())
}
