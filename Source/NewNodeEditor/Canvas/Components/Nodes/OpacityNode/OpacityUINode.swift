//
//  OpacityUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct OpacityUINode: View {
    var selectedNode: OpacityNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        VStack(spacing: 20){
            Text("\(Int(selectedNode.value * 100))%")
                .fontWeight(.bold)
            
            OpacitySlider(value: $selectedNode.value)
                .frame(height: 30)
        }
        
    }
}
