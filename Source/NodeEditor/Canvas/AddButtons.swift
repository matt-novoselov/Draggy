//
//  AddButtons.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct AddButtons: View {
    
    // Load canvasData from Environment
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    // Expand Smart Search menu on the click of the button
    var body: some View {
        Button(action: {canvasData.isMenuExpanded = true}){
            Image(systemName: "plus.circle")
        }
        .accessibilityLabel("Add new node")
        
    }
    
}
