//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
    // Property of the Node
    var value: Image? = Image("placeholder")
    
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
        
        self.uiPreviewElement = AnyView(ImageUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(ImageUINode(selectedNode: self))
        self.availableForLinkingNodes = [OpacityNode.self]
    }
    
}
