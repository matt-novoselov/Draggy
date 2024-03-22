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
    var value: Double
    
    required init(
        position: CGPoint = .zero
    ) {
        self.value = 0.5
        super.init(position: position)
    }
    
}
