//
//  TextNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class TextNode: Node {
    
    var id: UUID = UUID()
    var position: CGPoint = .zero
    var linkedNodes: [any Node] = []
    var availableForLinkingNodes: [any Node.Type] = [ColorNode.self, OpacityNode.self]
    
    // Property of the Node
    var text: String = "Hello World!"
}
