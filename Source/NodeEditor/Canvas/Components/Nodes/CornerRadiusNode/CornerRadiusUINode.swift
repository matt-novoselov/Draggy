//
//  CornerRadiusUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI


struct CornerRadiusUINode: View {
    
    @State var selectedNode: CornerRadiusNode

    let maxSliderValue: CGFloat = 100
    
    var bindingValue: Binding<CGFloat> {
        Binding(
            get: { selectedNode.value as! CGFloat },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        
        VStack{
            DynamicRadiusSquare(nodeValue: bindingValue, maxSliderValue: maxSliderValue)
            
            Slider(value: bindingValue, in: 0...maxSliderValue, step: 1)
        }
        
    }
}
