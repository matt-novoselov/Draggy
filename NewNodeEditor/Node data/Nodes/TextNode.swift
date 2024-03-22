//
//  TextNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class TextNode: Node {
    
    override init() {
        super.init()
        self.availableForLinkingNodes = [
            ColorNode.self,
            OpacityNode.self
        ]
    }
    
    // Property of the Node
    var value = "Hello World!"
}
