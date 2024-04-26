//
//  ColorUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

// ColorUINode is displayed in the canvas and allows user to select the color
struct ColorUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: ColorNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<Color> {
        Binding(
            get: { selectedNode.value as! Color },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        let color: Color = selectedNode.value as? Color ?? .black
        
        // Open color picker on click of the button
        Button(action: {UIColorWellHelper.helper.execute?()}){
            
            // Represent the currently selected color
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .aspectRatio(contentMode: .fit)
            
        }
        // Hide labels of color picker
        .background(
            ColorPicker("", selection: bindingValue, supportsOpacity: false)
                .labelsHidden()
                .opacity(0)
        )

    }
}
