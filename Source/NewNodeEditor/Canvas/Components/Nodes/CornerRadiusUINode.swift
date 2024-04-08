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
            RoundedRectangle(cornerRadius: selectedNode.value / 3)
                .fill(.clear)
                .stroke(.white, lineWidth: 8)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Slider(value: $selectedNode.value, in: 0...100, step: 1)
        }
        
    }
}
