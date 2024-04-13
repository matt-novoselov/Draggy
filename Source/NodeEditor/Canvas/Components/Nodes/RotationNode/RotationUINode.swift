//
//  RotationUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 25/03/24.
//

import SwiftUI

struct RotationUINode: View {
    
    @State var selectedNode: RotationNode
    
    var bindingValue: Binding<Angle> {
        Binding(
            get: { selectedNode.value as! Angle },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {

        let rotation: Angle = selectedNode.value as? Angle ?? .zero
        
        ZStack{
            RotatingDial(indicatorDiameter: 25, angle: bindingValue.degrees)
            
            Text("\(Int(rotation.degrees))°")
                .fontWeight(.bold)
                .contentTransition(.numericText())
                .withoutAnimation()
        }
    }
}

