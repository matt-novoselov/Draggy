//
//  ColorNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ColorNode: Node {
    
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
        self.uiNodeElement = AnyView(ColorUINode(selectedNode: self))
        self.availableForLinkingNodes = []
        self.value = Color.red
    }
    
    func getValue() -> Color{
        return self.value as! Color
    }
    
}
