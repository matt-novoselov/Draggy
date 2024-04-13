//
//  OpacityNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class OpacityNode: Node {
    
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
        self.uiNodeElement = AnyView(OpacityUINode(selectedNode: self))
        self.availableForLinkingNodes = []
        self.value = 0.5
    }
    
    func getValue() -> Double{
        return self.value as! Double
    }
    
}
