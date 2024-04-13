//
//  ImageNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ImageNode: Node {
    
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
        
        self.uiPreviewElement = AnyView(ImageUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(ImageUINode(selectedNode: self))
        self.availableForLinkingNodes = [OpacityNode.self, RotationNode.self, CornerRadiusNode.self, ShadowNode.self]
        self.value = Image("placeholder")
    }
    
    func getValue() -> Image{
        return self.value as! Image
    }
    
}
