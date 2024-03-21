//
//  NodeData.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class NodeData {
    var nodes: [any Node] = []
}

protocol Node: Identifiable {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [any Node] { get set }
    var availableForLinkingNodes: [any Node.Type] { get }
}

extension Node {
    mutating func addLinkedNode(_ node: any Node) {
        if !availableForLinkingNodes.contains(where: { $0 == type(of: node) }) {
            print("Node of type \(type(of: node)) is not allowed for linking")
            return
        }

        if let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) {
            if type(of: node) == type(of: linkedNodes[existingIndex]) {
                print("Replaced node of type \(type(of: node))")
                linkedNodes[existingIndex] = node
            } else {
                print("Cannot replace node: Types mismatch")
            }
        } else {
            print("Added node of type \(type(of: node))")
            linkedNodes.append(node)
        }
    }
}
