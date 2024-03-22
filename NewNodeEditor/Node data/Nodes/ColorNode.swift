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
    var value: Color
    
    required init(
        position: CGPoint = .zero
    ) {
        self.value = .red
        super.init(position: position)
    }
    
}
