//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    @Environment(NodeData.self) private var nodeData: NodeData
    
    var textIndex: Int
    
    var color: Color {
        getColorFromLinkedNodes(nodeData.textNodes[textIndex]) ?? .black
    }
    var opacity: Double {
        getOpacityFromLinkedNodes(nodeData.textNodes[textIndex])
    }
    var text: String {
        nodeData.textNodes[textIndex].text
    }

    var body: some View {
        Text(text)
            .foregroundColor(color)
            .opacity(opacity)
    }
}

