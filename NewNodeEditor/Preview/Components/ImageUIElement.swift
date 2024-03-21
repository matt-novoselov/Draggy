//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    
    var selectedNode: ImageNode
    
    var opacity: Double {
        getOpacityFromLinkedNodes(selectedNode)
    }

    var body: some View {
        selectedNode.image?
            .resizable()
            .scaledToFit()
            .padding()
            .opacity(opacity)
    }
}
