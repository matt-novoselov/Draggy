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
        
        VStack{
            Text("\(Int(degreesProxy))°")
            
            Slider(value: $degreesProxy, in: 0...270, step: 90)
        }
        .onChange(of: degreesProxy){
            withAnimation{
                selectedNode.value.degrees = degreesProxy
            }
        }
        
    }
}
