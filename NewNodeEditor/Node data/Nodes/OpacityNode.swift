//
//  OpacityNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class OpacityNode: Node {
    
    var id: UUID = UUID()
    var position: CGPoint = .zero
    var linkedNodes: [any Node] = []
    var availableForLinkingNodes: [any Node.Type] = []
    
    // Property of the Node
    var opacity: Double = 0.5
}

func getOpacityFromLinkedNodes(_ node: any Node) -> Double {
    for linkedNode in node.linkedNodes {
        if let opacityNode = linkedNode as? OpacityNode {
            return opacityNode.opacity
        }
    }
    return 1.0
}
