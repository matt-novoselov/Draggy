//
//  TextNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class TextNode: Node {
    
    // Property of the Node
    var value: String = "Hello World!"

    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = []
    ) {
        super.init(position: position, availableForLinkingNodes: [ColorNode.self, OpacityNode.self])
    }
}
