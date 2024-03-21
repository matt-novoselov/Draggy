//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var imageIndex: Int
    
    var opacity: Double {
        getOpacityFromLinkedNodes(nodeData.imageNodes[imageIndex])
    }

    var body: some View {

        nodeData.imageNodes[imageIndex].image?
            .resizable()
            .scaledToFit()
            .padding()
            .opacity(opacity)
    }
}
