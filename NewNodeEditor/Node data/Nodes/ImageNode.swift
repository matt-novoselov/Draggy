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
    
    // MARK:
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = [],
        uiNodeElement: any View = AnyView(EmptyView()),
        uiPreviewElement: any View = AnyView(EmptyView())
    ) {
        super.init(
            position: position,
            availableForLinkingNodes: [OpacityNode.self],
            uiNodeElement: uiNodeElement,
            uiPreviewElement: uiPreviewElement
        )
        
        self.uiPreviewElement = AnyView(ImageUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(ImageUINode(selectedNode: self))
    }
    
}
