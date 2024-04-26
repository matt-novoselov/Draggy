//
//  SFSymbolUINode.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

// SFSymbolUINode is displayed in the canvas and allows user to select the SF Symbol
struct SFSymbolUINode: View {
    
    // The node that is currently being edited
    @State var selectedNode: SFSymbolNode
    
    // Make node's value bindable, so it can be modified by the external component
    var bindingValue: Binding<String> {
        Binding(
            get: { selectedNode.value as! String },
            set: { newValue in selectedNode.value = newValue }
        )
    }
    
    // Property that controls if the selection sheet is visible
    @State var showingSelector: Bool = false
    
    var body: some View {

        // Display currently selected SF Symbol
        let iconName: String = selectedNode.value as? String ?? "N/A"
        
        // Present sheet on button click
        Button(action: {showingSelector = true}) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .buttonStyle(PlainButtonStyle())
        
        // Present selection sheet
        .sheet(isPresented: $showingSelector, content: {
            SFSymbolsPicker(selectedSymbol: bindingValue)
        })
        
    }
}
