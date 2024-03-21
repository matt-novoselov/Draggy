//
//  OpacityNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

class OpacityNode: Node {
    
    // Property of the Node
    var opacity: Double = 0.5
}

func getOpacityFromLinkedNodes(_ node: Node) -> Double {
    for linkedNode in node.linkedNodes {
        if let opacityNode = linkedNode as? OpacityNode {
            return opacityNode.opacity
        }
    }
    return 1.0
}
