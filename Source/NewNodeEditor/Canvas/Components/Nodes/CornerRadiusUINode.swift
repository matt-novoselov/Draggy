//
//  CornerRadiusUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI


struct CornerRadiusUINode: View {
    var selectedNode: CornerRadiusNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        VStack{
            Text("\(Int(selectedNode.value))")
            
            Slider(value: $selectedNode.value, in: 1...100, step: 1)
        }
        
    }
}

