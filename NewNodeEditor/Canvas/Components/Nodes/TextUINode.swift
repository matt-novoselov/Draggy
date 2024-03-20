//
//  TextUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TextUINode: View {
    @Binding var selectedNode: TextNode
    
    var body: some View {
        VStack{
            Text("Text")
                .fontWeight(.bold)
            
            TextField("Input Text", text: $selectedNode.text)
        }
    }
}