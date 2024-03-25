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
        
        VStack{
            Text("\(Int(selectedNode.value.degrees))°")
            
            Slider(value: $selectedNode.value.degrees, in: 0...360)
        }
        
    }
}
