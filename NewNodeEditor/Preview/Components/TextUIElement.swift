//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    @EnvironmentObject var nodeData: NodeData
    var textIndex: Int

    var body: some View {
        let color: Color = getColorFromLinkedNodes(nodeData.textNodes[textIndex]) ?? .black
        let opacity: Double = getOpacityFromLinkedNodes(nodeData.textNodes[textIndex])
        let text: String = nodeData.textNodes[textIndex].text
        
        Text(text)
            .foregroundColor(color)
            .opacity(opacity)
    }
}

