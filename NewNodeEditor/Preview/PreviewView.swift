//
//  PreviewView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct PreviewView: View {
    @EnvironmentObject var nodeData: NodeData
    
    var body: some View {
        
        VStack{
            // Text Nodes
            ForEach(nodeData.textNodes.indices, id: \.self) { index in
                TextUIElement(textIndex: index)
            }
            
            // Text Nodes
            ForEach(nodeData.imageNodes.indices, id: \.self) { index in
                ImageUIElement(imageIndex: index)
            }
        }
        .frame(width: 300)
        
    }
}

#Preview {
    PreviewView()
        .environmentObject(NodeData())
}
