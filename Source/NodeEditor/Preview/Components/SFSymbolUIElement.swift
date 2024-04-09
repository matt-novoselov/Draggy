//
//  SFSymbol.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUIElement: View {
    
    var selectedNode: SFSymbolNode
    
    var color: Color {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: ColorNode.self) as? ColorNode{
            return test.value
        }
     
        return .black
    }
    
    var opacity: Double {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: OpacityNode.self) as? OpacityNode{
            return test.value
        }
        
        return 1.0
    }
    
    var iconName: String {
        selectedNode.value
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

    var body: some View {
        Image(systemName: iconName)
            .shadow(color: shadowColor.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
            .rotationEffect(Angle(degrees: rotation))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
