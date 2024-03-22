//
//  ColorUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ColorUINode: View {
    var selectedNode: ColorNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        VStack{
            Text("Color")
                .fontWeight(.bold)
            
//            ColorPicker("Select", selection: $selectedNode.value)
        }

    }
}
