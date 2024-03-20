//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    var textNode: TextNode

    @State private var color: Color = .black // Default color
    @State private var opacity: Double = 1.0 // Default opacity

    var body: some View {
        Text(textNode.text)
            .foregroundColor(color)
            .opacity(opacity)
            .onReceive(getColorFromLinkedNodes(textNode).publisher) { linkedColor in
                self.color = linkedColor
            }
//            .onReceive(getOpacityFromLinkedNodes(textNode).Published) { linkedOpacity in
//                self.opacity = linkedOpacity
//            }
    }
}

