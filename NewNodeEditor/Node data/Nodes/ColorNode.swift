//
//  ColorNode.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

class ColorNode: Node {
    
    // Property of the Node
    var color: Color = .red
}

func getColorFromLinkedNodes(_ node: Node) -> Color? {
    for linkedNode in node.linkedNodes {
        if let colorNode = linkedNode as? ColorNode {
            return colorNode.color
        }
    }
    return nil
}
