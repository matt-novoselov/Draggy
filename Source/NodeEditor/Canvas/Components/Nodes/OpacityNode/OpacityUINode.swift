//
//  OpacityUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

// OpacityUINode is displayed in the canvas and allows user to select the amount of opacity
struct OpacityUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: OpacityNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<Double> {
        Binding(
            get: { selectedNode.value as! Double },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        let opacity: Double = selectedNode.value as? Double ?? 1.0
        let opacityPercent: String = "\(Int(opacity * 100))%"
        
        // Display slider and current opacity in percents
        VStack(spacing: 20){
            Text(opacityPercent)
                .fontWeight(.bold)
                .accessibilityLabel("Opacity of \(opacityPercent)")
            
            OpacitySlider(value: bindingValue)
                .frame(height: 30)
                .accessibilityLabel("Opacity slider")
        }
        
    }
}
