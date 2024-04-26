//
//  ButtonUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

// ButtonUINode is displayed in the canvas and allows user to select the action that should happen when someone clicks the button
struct ButtonUINode: View {
    
    // The node that is currently being edited
    var selectedNode: ButtonNode
    
    var body: some View {
        
        Button("Button") {}
            .buttonStyle(BorderedButtonStyle())
            .allowsHitTesting(false)
        
    }
}
