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
        
        let color: Color = selectedNode.getValueFrom(ColorNode.self) as? Color ?? .black
        let opacity: Double = selectedNode.getValueFrom(OpacityNode.self) as? Double ?? 1.0
        let rotation: Angle = selectedNode.getValueFrom(RotationNode.self) as? Angle ?? .zero
        let cornerRadius: CGFloat = selectedNode.getValueFrom(RotationNode.self) as? CGFloat ?? 0
        let shadowRadius: Double = selectedNode.getValueFrom(ShadowNode.self) as? Double ?? 0
        
//        var imageView: any View = selectedNode.getValueFrom(ImageNode.self) as? some View
//        var symbolView: any View = selectedNode.getValueFrom(SFSymbolNode.self) as? View ?? AnyView(EmptyView())
//        var textView: any View = selectedNode.getValueFrom(TextNode.self) as? View ?? AnyView(EmptyView())
        
        
        
        Button(action: {action}) {
            
            EmptyView()
//            VStack {
//                HStack {
//                    symbolView
//                    textView
//                }
//                imageView
//            }
            
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .background(color)
        .cornerRadius(cornerRadius)
        .shadow(color: .black.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
        .rotationEffect(Angle(degrees: rotation.degrees))
        .opacity(opacity)
    }
}
