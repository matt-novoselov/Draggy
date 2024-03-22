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
    var value: Image?
    
    required init(
        position: CGPoint = .zero
    ) {
        self.value = Image("placeholder")
        super.init(position: position)
    }
    
}
