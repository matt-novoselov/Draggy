//
//  SFSymbol.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUIElement: View {
    
    var selectedNode: SFSymbolNode
    
    var body: some View {
        
        let iconName: String = selectedNode.value as? String ?? "N/A"
        
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        
        
        Image(systemName: iconName)
            .font(.title2)
            .fontWeight(.bold)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
