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
        let shadowRadius: Double = selectedNode.getValueFrom(ShadowNode.self) as? Double ?? 0
        
        
        Image(systemName: iconName)
            .font(.title2)
            .fontWeight(.bold)
            .shadow(color: .black.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
