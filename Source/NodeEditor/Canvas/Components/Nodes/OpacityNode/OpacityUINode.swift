//
//  OpacityUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct OpacityUINode: View {
    
    @State var selectedNode: OpacityNode
    
    var bindingValue: Binding<Double> {
        Binding(
            get: { selectedNode.value as! Double },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        let opacity: Double = selectedNode.value as? Double ?? 1.0
        
        VStack(spacing: 20){
            Text("\(Int(opacity * 100))%")
                .fontWeight(.bold)
            
            OpacitySlider(value: bindingValue)
                .frame(height: 30)
        }
        
    }
}
