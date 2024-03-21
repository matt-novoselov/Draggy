//
//  OpacityUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct OpacityUINode: View {
    @Binding var selectedNode: OpacityNode
    
    var body: some View {
        VStack{
            Text("Opacity")
                .fontWeight(.bold)
            
            Text("\(Int(selectedNode.opacity * 100))%")
            
            Slider(value: $selectedNode.opacity)
        }
        
    }
}
