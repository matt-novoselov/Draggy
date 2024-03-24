//
//  OpacityNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class OpacityNode: Node {
    
    // Property of the Node
    var value: Double = 0.5
    
    // MARK: 
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = []
    ) {
        super.init(position: position, availableForLinkingNodes: [])
    }
    
}
