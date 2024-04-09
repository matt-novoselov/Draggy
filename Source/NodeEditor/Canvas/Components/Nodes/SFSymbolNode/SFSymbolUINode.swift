//
//  SFSymbolUINode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUINode: View {
    
    var selectedNode: SFSymbolNode
    
    @State var showingSelector: Bool = false
    
    var body: some View {
        
        @Bindable var selectedNode = selectedNode
        
        Button(action: {showingSelector = true}) {
            Image(systemName: selectedNode.value)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showingSelector, content: {
            SFSymbolsPicker(selectedSymbol: $selectedNode.value)
        })
        
    }
}
