//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    var selectedNode: TextNode
    
    var text: String {
        selectedNode.value
    }
    
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
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .shadow(color: shadowColor.opacity(shadowRadius==0 ? 0 : 1), radius: shadowRadius)
            .multilineTextAlignment(.center)
            .rotationEffect(Angle(degrees: rotation))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
