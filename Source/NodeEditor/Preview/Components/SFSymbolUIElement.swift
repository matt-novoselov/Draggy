//
//  SFSymbol.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUIElement: View {
    
    // SF Symbol Node from which values should be extracted
    var selectedNode: SFSymbolNode
    
    var body: some View {
        
        // Get icon Nnme from node
        let iconName: String = selectedNode.value as? String ?? "N/A"
        
        // Get color from linked node
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        // Get opacity from linked node
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        // Get rotation from linked node
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        
        // Display and apply all of the modifiers
        Image(systemName: iconName)
            .font(.title2)
            .fontWeight(.bold)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
