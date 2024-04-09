//
//  AddButtons.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct AddButtons: View {
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    let buttonListViewModel = ButtonListViewModel().buttons
    
    @State var showingMenu: Bool = false
    
    var body: some View {
        Button(action: {canvasData.isMenuExpanded = true}){
            Image(systemName: "plus.circle")
        }
    }
    
}
