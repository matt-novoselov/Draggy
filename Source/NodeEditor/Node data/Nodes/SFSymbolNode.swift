//
//  SFSymbolNode.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

@Observable
class SFSymbolNode: Node {

    // MARK: DO NOT modify required initializer
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
            uiPreviewElement: uiPreviewElement
        )
        
        // Setup default properties of the Node here
        self.uiPreviewElement = AnyView(SFSymbolUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(SFSymbolUINode(selectedNode: self))
        self.availableForLinkingNodes = [ColorNode.self, OpacityNode.self, RotationNode.self, ShadowNode.self]
        self.value = "star.fill"
    }

}
