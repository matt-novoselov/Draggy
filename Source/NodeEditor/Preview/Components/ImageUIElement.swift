//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    
    var selectedNode: ImageNode
    
    var body: some View {
        
        let image: Image = selectedNode.value as? Image ?? Image("placeholder")
        
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        let cornerRadius: CGFloat = selectedNode.getValueFrom(CornerRadiusNode.self) as? CGFloat ?? 0
        
        image
            .resizable()
            .scaledToFit()
            .cornerRadius(cornerRadius)
//            .shadow(color: .black.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .padding()
            .opacity(opacity)
    }
}
