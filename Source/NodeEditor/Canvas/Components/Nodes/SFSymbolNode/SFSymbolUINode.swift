//
//  SFSymbolUINode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUINode: View {
    
    @State var selectedNode: SFSymbolNode
    
    var bindingValue: Binding<String> {
        Binding(
            get: { selectedNode.value as! String },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    @State var showingSelector: Bool = false
    
    var body: some View {

        let iconName: String = selectedNode.value as? String ?? "N/A"
        
        Button(action: {showingSelector = true}) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingSelector, content: {
            SFSymbolsPicker(selectedSymbol: bindingValue)
        })
        
    }
}
