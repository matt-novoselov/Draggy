//
//  ShadowUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

struct ShadowUINode: View {
    
    @State var selectedNode: ShadowNode
    
    var bindingValue: Binding<Double> {
        Binding(
            get: { selectedNode.value as! Double },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {

        let shadowRadius: Double = selectedNode.value as? Double ?? 0
        
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .white, radius: shadowRadius)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Slider(value: bindingValue, in: 0...50)
        }
        
    }
}
