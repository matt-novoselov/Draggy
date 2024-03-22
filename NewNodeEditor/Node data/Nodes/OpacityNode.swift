//
//  OpacityNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class OpacityNode: Node<Any> {
    
    // Property of the Node
    var opacity: Double = 0.5
}

func getOpacityFromLinkedNodes(_ node: Node<Any>) -> Double {
    for linkedNode in node.linkedNodes {
        if let opacityNode = linkedNode as? OpacityNode {
            return opacityNode.opacity
        }
    }
    return 1.0
}
