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
        
        @Bindable var nodeData = nodeData
        
        VStack{
            // Text Nodes
            ForEach($nodeData.wrappedValue.textNodes.indices, id: \.self) { index in
                TextUIElement(textIndex: index)
            }
            
            // Text Nodes
            ForEach($nodeData.wrappedValue.imageNodes.indices, id: \.self) { index in
                ImageUIElement(imageIndex: index)
            }
        }
        .frame(width: 300)
        
    }
}

#Preview {
    PreviewView()
        .environment(NodeData())
}
