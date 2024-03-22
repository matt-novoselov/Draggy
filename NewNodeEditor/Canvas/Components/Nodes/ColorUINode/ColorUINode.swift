//
//  ColorUINode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ColorUINode: View {
    var selectedNode: ColorNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        Button(action: {UIColorWellHelper.helper.execute?()}){
            
            RoundedRectangle(cornerRadius: 10)
                .fill(selectedNode.value)
                .aspectRatio(contentMode: .fit)
            
        }
        .background(
            ColorPicker("", selection: $selectedNode.value, supportsOpacity: false)
                .labelsHidden().opacity(0)
        )

    }
}
