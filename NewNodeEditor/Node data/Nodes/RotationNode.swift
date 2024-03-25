//
//  RotationNode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 25/03/24.
//

import SwiftUI

@Observable
class RotationNode: Node {
    
    // Property of the Node
    var value: Angle = .zero
    
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
        
        self.uiPreviewElement = AnyView(EmptyView())
        self.uiNodeElement = AnyView(RotationUINode(selectedNode: self))
        self.availableForLinkingNodes = []
    }
    
}
