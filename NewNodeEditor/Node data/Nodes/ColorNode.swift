//
//  ColorNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class ColorNode: Node<Color> {
    
    func getOpacity(from nodes: any NodeObject) -> Double? {
        Node<Any>.getValue(as: Double.self, from: nodes)
    }
    
}
