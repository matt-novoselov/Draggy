//
//  ImageUIElement.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    
    // Image Node from which values should be extracted
    var selectedNode: ImageNode
    
    var body: some View {
        
        // Get image from node
        let image: Image = selectedNode.value as? Image ?? Image("placeholder")
        
        // Get opacity from linked node
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        // Get rotation from linked node
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        // Get corner radius from linked node
        let cornerRadius: CGFloat = selectedNode.getValueFrom(CornerRadiusNode.self) as? CGFloat ?? 0
        
        // Display and apply all of the modifiers
        image
            .resizable()
            .scaledToFit()
            .cornerRadius(cornerRadius)
            .rotationEffect(Angle(degrees: rotation.degrees))
            .padding()
            .opacity(opacity)
    }
}
