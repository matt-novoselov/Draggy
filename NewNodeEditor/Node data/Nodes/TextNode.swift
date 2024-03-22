//
//  TextNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class TextNode: Node {
    
    // Property of the Node
    var value: String

    required init(
        position: CGPoint = .zero
    ) {
        self.value = "Hello World!"
        super.init(position: position)
    }
}
