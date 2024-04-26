//
//  TextElement.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    // Text Node from which values should be extracted
    var selectedNode: TextNode

    var body: some View {
        
        // Get text from node
        let text: String = selectedNode.value as? String ?? "N/A"
        
        // Get color from linked node
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        // Get opacity from linked node
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        // Get rotation from linked node
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        
        // Display and apply all of the modifiers
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
