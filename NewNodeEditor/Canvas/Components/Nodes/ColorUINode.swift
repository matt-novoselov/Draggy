//
//  ColorUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ColorUINode: View {
    @Binding var selectedNode: ColorNode
    
    var body: some View {
        VStack{
            BezierPath2(selfNode: selectedNode)
            
            Text("Color")
                .fontWeight(.bold)
            
            ColorPicker("Select", selection: $selectedNode.color)
        }

    }
}
