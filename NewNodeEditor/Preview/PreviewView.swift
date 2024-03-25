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
            ForEach(nodeData.nodes) { node in
                AnyView(node.uiPreviewElement)
            }
        }
        .frame(width: 300)
        
    }

}

#Preview {
    PreviewView()
        .environment(NodeData())
}
