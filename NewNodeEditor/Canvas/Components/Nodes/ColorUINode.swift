//
//  ColorUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ColorUINode: View {
    @Binding var selectedNode: ColorNode
    @State var endPoint: CGPoint = .zero
    
    var body: some View {
        VStack{
            BezierPath2(startPoint: .constant(.zero), endPoint: $endPoint, selfNodePosition: $selectedNode.position)
            
            Text("Color")
                .fontWeight(.bold)
            
            ColorPicker("Select", selection: $selectedNode.color)
        }

    }
}
