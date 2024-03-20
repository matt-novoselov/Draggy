//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

class ImageNode: Node {
    var id: UUID = UUID()
    var position: CGPoint = .zero
    @Published var linkedNodes: [any Node] = []
    
    // Property of the Node
    @Published var image: Image? = Image("placeholder")
}
