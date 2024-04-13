//
//  SFSymbolNode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

@Observable
class SFSymbolNode: Node {

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
        
        self.uiPreviewElement = AnyView(SFSymbolUIElement(selectedNode: self))
        self.uiNodeElement = AnyView(SFSymbolUINode(selectedNode: self))
        self.availableForLinkingNodes = [ColorNode.self, OpacityNode.self, RotationNode.self, ShadowNode.self]
        self.value = "star.fill"
    }
    
    func getValue() -> String{
        return self.value as! String
    }
    
}
