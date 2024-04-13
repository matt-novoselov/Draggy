//
//  TextUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUINode: View {
    
    @State var selectedNode: TextNode
    
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
