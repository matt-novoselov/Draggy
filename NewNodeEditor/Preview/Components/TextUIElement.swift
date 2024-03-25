//
//  TextElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUIElement: View {
    
    var selectedNode: TextNode
    
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
    
    var text: String {
        selectedNode.value
    }

    var body: some View {
        Text(text)
            .foregroundColor(color)
            .opacity(opacity)
    }
}

