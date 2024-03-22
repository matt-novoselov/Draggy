//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
    // Property of the Node
    var value: Image? = Image("placeholder")
    
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = []
    ) {
        super.init(position: position, availableForLinkingNodes: [OpacityNode.self])
    }
    
}
