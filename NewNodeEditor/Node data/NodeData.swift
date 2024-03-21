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
    
    func deleteNode(_ node: any Node) {
        withAnimation {
            nodes.removeAll { $0.id == node.id }
        }
    }
}

protocol Node: Identifiable {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [any Node] { get set }
    var availableForLinkingNodes: [any Node.Type] { get }
}

extension Node {
    mutating func addLinkedNode(_ node: any Node) {
        guard availableForLinkingNodes.contains(where: { $0 == type(of: node) }) else {
            print("Node of type \(type(of: node)) is not allowed for linking")
            return
        }
        
        guard let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) else {
            print("Added node of type \(type(of: node))")
            linkedNodes.append(node)
            return
        }

        guard type(of: node) == type(of: linkedNodes[existingIndex]) else {
            print("Cannot replace node: Types mismatch")
            return
        }

        print("Replaced node of type \(type(of: node))")
        linkedNodes[existingIndex] = node
    }
}
