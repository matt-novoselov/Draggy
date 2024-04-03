//
//  TextUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUINode: View {
    var selectedNode: TextNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        TextField("Enter some text here", text: $selectedNode.value, axis: .vertical)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}
