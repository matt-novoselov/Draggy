//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
    override init() {
        super.init()
        self.availableForLinkingNodes = [
            OpacityNode.self
        ]
    }
    
    // Property of the Node
    var value: Image? = Image("placeholder")
}
