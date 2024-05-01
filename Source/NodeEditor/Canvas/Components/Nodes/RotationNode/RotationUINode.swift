//
//  RotationUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 25/03/24.
//

import SwiftUI

// RotationUINode is displayed in the canvas and allows user to select the angle of rotation
struct RotationUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: RotationNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<Angle> {
        Binding(
            get: { selectedNode.value as! Angle },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {

        let rotation: Angle = selectedNode.value as? Angle ?? .zero
        let rotationDegrees: String = "\(Int(rotation.degrees))°"
        
        ZStack{
            RotatingDial(indicatorDiameter: 25, angle: bindingValue.degrees)
                .accessibilityLabel("Rotation dial")
            
            Text(rotationDegrees)
                .fontWeight(.bold)
                .contentTransition(.numericText())
                .withoutAnimation()
                .accessibilityLabel("Selected angle: \(rotationDegrees)")
        }
    }
}

