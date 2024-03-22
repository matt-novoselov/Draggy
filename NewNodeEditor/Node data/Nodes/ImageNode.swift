//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node<Any> {
    
    override init() {
        super.init()
        self.availableForLinkingNodes = [
            OpacityNode.self
        ] as! NodeTypeList
    }
    
    // Property of the Node
    var image: Image? = Image("placeholder")
}
