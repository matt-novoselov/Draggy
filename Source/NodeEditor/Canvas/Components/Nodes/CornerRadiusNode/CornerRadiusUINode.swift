//
//  CornerRadiusUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

// CornerRadiusUINode is displayed in the canvas and allows user to select the radius of roundness of corners
struct CornerRadiusUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: CornerRadiusNode

    let maxSliderValue: CGFloat = 100
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<CGFloat> {
        Binding(
            get: { selectedNode.value as! CGFloat },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        
        VStack{
            // Represent value using rectangle with dynamic corner radius
            DynamicRadiusSquare(nodeValue: bindingValue, maxSliderValue: maxSliderValue)
            
            // Control value using slider
            Slider(value: bindingValue, in: 0...maxSliderValue, step: 1)
        }
        
    }
}
