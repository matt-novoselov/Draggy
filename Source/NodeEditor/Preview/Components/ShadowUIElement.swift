//
//  ShadowUIElement.swift
//  Draggy
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

struct ShadowUIElement: View {
    
    // Content to what the shade should be applied
    var content: AnyView
    
    // Shadow Node from which values should be extracted
    var selectedNode: ShadowNode

    var body: some View {

        // Get color from linked node
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        // Get shadow radius from linked node
        let shadowRadius: Double = selectedNode.getValueFrom(ShadowNode.self) as? Double ?? 0
        
        // Display and apply all of the modifiers
        content
            .shadow(color: color.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
    }
}

extension View {
    func withShadow(selectedNode: ShadowNode) -> some View {
        ShadowUIElement(content: AnyView(self), selectedNode: selectedNode)
    }
}
