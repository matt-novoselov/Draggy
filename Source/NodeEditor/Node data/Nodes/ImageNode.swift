//
//  ImageNode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
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
        self.uiPreviewElement = AnyView(ImageUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(ImageUINode(selectedNode: self))
        self.availableForLinkingNodes = [OpacityNode.self, RotationNode.self, CornerRadiusNode.self, ShadowNode.self]
        self.value = Image("placeholder")
    }

}
