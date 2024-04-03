//
//  RotationUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 25/03/24.
//

import SwiftUI

struct RotationUINode: View {
    var selectedNode: RotationNode
    
    @State var degreesProxy: Double = 0
    
    var body: some View {
        
        ZStack{
            RotatingDial(indicatorDiameter: 25, angle: $degreesProxy)
            
            Text("\(Int(degreesProxy))°")
                .fontWeight(.bold)
        }
        .onChange(of: degreesProxy){
            withAnimation{
                selectedNode.value.degrees = degreesProxy
            }
        }
        
    }
}
