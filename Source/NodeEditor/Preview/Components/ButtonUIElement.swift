//
//  ButtonUIElement.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct ButtonUIElement: View {
    
    var selectedNode: ButtonNode
    
    var action: () -> Void {
        return {print("Executing Button's action")}
    }
    
    var image: some View {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: ImageNode.self) as? ImageNode {
            return AnyView(test.uiPreviewElement)
        }

        return AnyView(EmptyView())
    }
    
    var symbol: some View {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: SFSymbolNode.self) as? SFSymbolNode {
            return AnyView(test.uiPreviewElement)
        }

        return AnyView(EmptyView())
    }
    
    var text: some View {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: TextNode.self) as? TextNode {
            return AnyView(test.uiPreviewElement)
        }

        return AnyView(Text("Button"))
    }
    
    var color: Color {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: ColorNode.self) as? ColorNode{
            return test.value
        }
     
        return .accent
    }
    
    var opacity: Double {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: OpacityNode.self) as? OpacityNode{
            return test.value
        }
        
        return 1.0
    }
    
    var rotation: Double {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: RotationNode.self) as? RotationNode{
            return test.value.degrees
        }
        
        return .zero
    }
    
    var shadowRadius: Double {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: ShadowNode.self) as? ShadowNode{
            return test.value
        }
        
        return 0
    }
    
    var shadowColor: Color {
        if let shadowNode = selectedNode.parseLinkedNodes(linkedNodeType: ShadowNode.self) as? ShadowNode{

            if let test = shadowNode.parseLinkedNodes(linkedNodeType: ColorNode.self) as? ColorNode{
                return test.value
            }
        }
        
        return .black
    }
    
    var cornerRadius: CGFloat {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: CornerRadiusNode.self) as? CornerRadiusNode{
            return test.value
        }
        
        return 0
    }

    var body: some View {
        Button(action: action) {
            
            VStack{
                HStack{
                    symbol
                    
                    text
                }
                
                image
            }

        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .background(color)
        .cornerRadius(cornerRadius)
        .shadow(color: shadowColor.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
        .rotationEffect(Angle(degrees: rotation))
        .opacity(opacity)
    }
}
