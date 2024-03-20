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
            ForEach(nodeData.textNodes) { textNode in
                TextUIElement(textNode: textNode)
            }
            
            // Text Nodes
            ForEach(nodeData.imageNodes) { imageNode in
                ImageUIElement(imageNode: imageNode)
            }
        }
        .frame(width: 300)
        
    }
}

#Preview {
    PreviewView()
        .environmentObject(NodeData())
}
