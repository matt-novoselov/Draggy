//
//  TextUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

// TextUINode is displayed in the canvas and allows user to edit the text
struct TextUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: TextNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<String> {
        Binding(
            get: { selectedNode.value as! String },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        TextField("Enter text", text: bindingValue, axis: .vertical)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}
