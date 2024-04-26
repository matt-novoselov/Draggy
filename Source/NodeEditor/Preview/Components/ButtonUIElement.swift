//
//  ButtonUIElement.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct ButtonUIElement: View {
    
    // Button Node from which values should be extracted
    var selectedNode: ButtonNode

    var body: some View {
        
        // Get action from node that button should perform
        let action: Void = print("Executing Button's action")
        
        // Get color from linked node
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .blue
        // Get opacity from linked node
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        // Get rotation from linked node
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        // Get corner radius from linked node
        let cornerRadius: CGFloat = selectedNode.getValueFrom(CornerRadiusNode.self) as? CGFloat ?? 0
        
        // Get image view from linked node
        let imageView: AnyView = selectedNode.getUIFrom(ImageNode.self) as? AnyView ?? AnyView(EmptyView())
        // Get symbol view from linked node
        let symbolView: AnyView = selectedNode.getUIFrom(SFSymbolNode.self) as? AnyView ?? AnyView(EmptyView())
        // Get text view from linked node
        let textView: AnyView = selectedNode.getUIFrom(TextNode.self) as? AnyView ?? AnyView(Text("Button"))
        
        // Display and apply all of the modifiers
        Button(action: {action}) {
            
            VStack {
                symbolView
                textView
                imageView
            }
            
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .background(color)
        .cornerRadius(cornerRadius)
        .rotationEffect(Angle(degrees: rotation.degrees))
        .opacity(opacity)
    }
}
