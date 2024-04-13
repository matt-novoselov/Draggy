//
//  ColorUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ColorUINode: View {
    
    @State var selectedNode: ColorNode
    
    var bindingValue: Binding<Color> {
        Binding(
            get: { selectedNode.value as! Color },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    var body: some View {
        let color: Color = selectedNode.value as? Color ?? .black
        
        Button(action: {UIColorWellHelper.helper.execute?()}){
            
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .aspectRatio(contentMode: .fit)
            
        }
        .background(
            ColorPicker("", selection: bindingValue, supportsOpacity: false)
                .labelsHidden()
                .opacity(0)
        )

    }
}
