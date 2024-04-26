//
//  CornerRadiusNode.swift
//  Draggy
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

@Observable
class CornerRadiusNode: Node {

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
        self.uiPreviewElement = AnyView(EmptyView())
        self.uiNodeElement = AnyView(CornerRadiusUINode(selectedNode: self))
        self.availableForLinkingNodes = []
        self.value = CGFloat(25)
    }

}
