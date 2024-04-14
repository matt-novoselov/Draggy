//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    var selectedNode: TextNode

    var body: some View {
        
        let text: String = selectedNode.value as? String ?? "N/A"
        
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
