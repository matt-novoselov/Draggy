//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    
    var selectedNode: ImageNode
    
    var opacity: Double {
        if let test = selectedNode.parseLinkedNodes(linkedNodeType: OpacityNode.self) as? OpacityNode{
            return test.value
        }
        
        return 1.0
    }

    var body: some View {
        selectedNode.value?
            .resizable()
            .scaledToFit()
            .padding()
            .opacity(opacity)
    }
}
