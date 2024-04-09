//
//  ButtonUINode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct ButtonUINode: View {
    var selectedNode: ButtonNode
    
    var body: some View {
        
        Button("Button") {}
            .buttonStyle(BorderedButtonStyle())
            .allowsHitTesting(false)
        
    }
}
