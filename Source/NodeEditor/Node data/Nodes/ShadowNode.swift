//
//  ShadowNode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

@Observable
class ShadowNode: Node {

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
        
        self.uiPreviewElement = AnyView(EmptyView())
        self.uiNodeElement = AnyView(ShadowUINode(selectedNode: self))
        self.availableForLinkingNodes = [ColorNode.self]
        self.value = 15.0
    }
    
    func getValue() -> Double{
        return self.value as! Double
    }
    
}
