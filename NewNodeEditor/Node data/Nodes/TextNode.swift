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
    var value: String = "Hello World!"

    // MARK: 
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = [],
        uiNodeElement: any View = AnyView(EmptyView()),
        uiPreviewElement: any View = AnyView(EmptyView())
    ) {
        super.init(
            position: position,
            availableForLinkingNodes: [ColorNode.self, OpacityNode.self],
            uiNodeElement: uiNodeElement,
            uiPreviewElement: uiPreviewElement
        )
        
        self.uiPreviewElement = AnyView(TextUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(TextUINode(selectedNode: self))
    }
    
}
