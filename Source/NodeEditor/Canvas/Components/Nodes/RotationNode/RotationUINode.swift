//
//  RotationUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 25/03/24.
//

import SwiftUI

struct RotationUINode: View {
    var selectedNode: RotationNode
    
    var body: some View {
        
        @Bindable var selectedNode = selectedNode
        
        ZStack{
            RotatingDial(indicatorDiameter: 25, angle: $selectedNode.value.degrees)
            
            Text("\(Int(selectedNode.value.degrees))°")
                .fontWeight(.bold)
                .contentTransition(.numericText())
//                .animation(.none)
        }
    }
}

