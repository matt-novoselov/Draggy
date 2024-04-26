//
//  CanvasData.swift
//  Draggy
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

// Define a class to hold data related to the canvas
@Observable
class CanvasData {
    // Variable to store the geometry of the canvas and it's size
    var canvasGeometry: GeometryProxy?
    
    // Variable to track whether the menu (Smart Search) is expanded or not
    var isMenuExpanded: Bool = false
}
