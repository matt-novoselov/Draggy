//
//  ButtonUIElement.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct ButtonUIElement: View {
    
    var selectedNode: ButtonNode

    var body: some View {
        
        let action: Void = print("Executing Button's action")
        
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .blue
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        let cornerRadius: CGFloat = selectedNode.getValueFrom(CornerRadiusNode.self) as? CGFloat ?? 0
        
        let imageView: AnyView = selectedNode.getUIFrom(ImageNode.self) as? AnyView ?? AnyView(EmptyView())
        let symbolView: AnyView = selectedNode.getUIFrom(SFSymbolNode.self) as? AnyView ?? AnyView(EmptyView())
        let textView: AnyView = selectedNode.getUIFrom(TextNode.self) as? AnyView ?? AnyView(Text("Button"))
        
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
