//
//  ColorNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ColorNode: Node {
    
    // Property of the Node
    var value: Color = .red
    
    // MARK: 
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = []
    ) {
        super.init(position: position, availableForLinkingNodes: [])
    }
    
}
