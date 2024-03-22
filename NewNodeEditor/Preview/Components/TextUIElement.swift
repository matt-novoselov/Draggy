//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    var selectedNode: TextNode
    
    var color: Color {
//        getColorFromLinkedNodes(selectedNode) ??,
            .black
    }
    var opacity: Double {
        getOpacityFromLinkedNodes(selectedNode)
    }
    var text: String {
        selectedNode.text
    }

    var body: some View {
        Text(text)
            .foregroundColor(color)
            .opacity(opacity)
    }
}

