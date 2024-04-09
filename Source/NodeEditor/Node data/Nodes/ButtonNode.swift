//
//  ButtonNode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

@Observable
class ButtonNode: Node {
    
    // Property of the Node
    var value: () -> Void = {}

    required init(
        position: CGPoint,
        availableForLinkingNodes: [Node.Type],
        uiNodeElement: any View,
        uiPreviewElement: any View
    ) {
        super.init(
            position: position,
            availableForLinkingNodes: availableForLinkingNodes,
            uiNodeElement: uiNodeElement,
            uiPreviewElement: uiPreviewElement
        )
        
        self.uiPreviewElement = AnyView(ButtonUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(ButtonUINode(selectedNode: self))
        self.availableForLinkingNodes = [OpacityNode.self, ColorNode.self, RotationNode.self, CornerRadiusNode.self, ShadowNode.self, TextNode.self, ImageNode.self, SFSymbolNode.self]
    }
    
}
