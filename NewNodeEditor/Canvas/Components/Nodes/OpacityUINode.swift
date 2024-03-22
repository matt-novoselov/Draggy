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
        
        VStack{
            Text("\(Int(selectedNode.value * 100))%")
            
            Slider(value: $selectedNode.value)
        }
        
    }
}
