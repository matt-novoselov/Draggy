//
//  ShadowUIElement.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

struct ShadowUIElement: View {
    
    var content: AnyView
    
    var selectedNode: ShadowNode

    var body: some View {

        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        let shadowRadius: Double = selectedNode.getValueFrom(ShadowNode.self) as? Double ?? 0
        
        content
            .shadow(color: color.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
    }
}

extension View {
    func withShadow(selectedNode: ShadowNode) -> some View {
        ShadowUIElement(content: AnyView(self), selectedNode: selectedNode)
    }
}
