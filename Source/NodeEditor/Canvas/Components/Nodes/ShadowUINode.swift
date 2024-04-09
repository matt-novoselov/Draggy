//
//  ShadowUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

struct ShadowUINode: View {
    var selectedNode: ShadowNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .white, radius: selectedNode.value)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Slider(value: $selectedNode.value, in: 0...50)
        }
        
    }
}
