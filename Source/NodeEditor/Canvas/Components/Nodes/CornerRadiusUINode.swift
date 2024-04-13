//
//  CornerRadiusUINode.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI


struct CornerRadiusUINode: View {
    
    @State var selectedNode: CornerRadiusNode
    
    var bindingValue: Binding<CGFloat> {
        Binding(
            get: { selectedNode.value as! CGFloat },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {

        let cornerRadius: CGFloat = selectedNode.value as? CGFloat ?? 0
        
        VStack{
            RoundedRectangle(cornerRadius: cornerRadius / 3)
                .fill(.clear)
                .stroke(.white, lineWidth: 8)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Slider(value: bindingValue, in: 0...100, step: 1)
        }
        
    }
}
