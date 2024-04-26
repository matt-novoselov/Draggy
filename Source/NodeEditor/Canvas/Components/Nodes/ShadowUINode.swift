//
//  ShadowUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

// ShadowUINode is displayed in the canvas and allows user to select the amount of radius for the shadow
struct ShadowUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: ShadowNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<Double> {
        Binding(
            get: { selectedNode.value as! Double },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {

        let shadowRadius: Double = selectedNode.value as? Double ?? 0
        
        VStack{
            // Represent value using shadow on the rectangle
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .white, radius: shadowRadius)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            // Control value using slider
            Slider(value: bindingValue, in: 0...50)
        }
        
    }
}
