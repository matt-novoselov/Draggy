//
//  ColorNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ColorNode: Node {
    var id: UUID = UUID()
    var position: CGPoint = .zero
    var linkedNodes: [any Node] = []
    var availableForLinkingNodes: [any Node.Type] = []
    
    // Property of the Node
    var color: Color = .red
}

func getColorFromLinkedNodes(_ node: any Node) -> Color? {
    for linkedNode in node.linkedNodes {
        if let colorNode = linkedNode as? ColorNode {
            return colorNode.color
        }
    }
    return nil
}
