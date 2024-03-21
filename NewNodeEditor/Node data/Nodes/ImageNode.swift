//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
    var id: UUID = UUID()
    var position: CGPoint = .zero
    var linkedNodes: [any Node] = []
    var availableForLinkingNodes: [any Node.Type] = [OpacityNode.self]
    
    // Property of the Node
    var image: Image? = Image("placeholder")
}
