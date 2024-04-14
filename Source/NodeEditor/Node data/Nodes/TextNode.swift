//
//  TextNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class TextNode: Node {

    required init(
        position: CGPoint,
        availableForLinkingNodes: [Node.Type],
        uiNodeElement: any View,
        uiPreviewElement: any View,
        value: Any
    ) {
        super.init(
            position: position,
            availableForLinkingNodes: availableForLinkingNodes,
            uiNodeElement: uiNodeElement,
            uiPreviewElement: uiPreviewElement,
            value: value
        )
        
        self.uiPreviewElement = AnyView(TextUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(TextUINode(selectedNode: self))
        self.availableForLinkingNodes = [ColorNode.self, OpacityNode.self, RotationNode.self, ShadowNode.self]
        self.value = "Hello World!"
    }
    
}
