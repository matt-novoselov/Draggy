//
//  NodeData.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class NodeData {
    var nodes: [Node] = []
    
    func deleteNode(_ node: Node) {
        withAnimation {
            nodes.removeAll { $0.id == node.id }
        }
    }
}

protocol NodeProtocol: Identifiable, AnyObject {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [Node] { get set }
    var availableForLinkingNodes: [Node.Type] { get }
}

@Observable
class Node: NodeProtocol {
    var id: UUID = .init()
    var position: CGPoint = .zero
    var linkedNodes: [Node] = []
    var availableForLinkingNodes: [Node.Type] = []
}

// MARK: 
extension Node {
    func addLinkedNode(_ node: Node) {
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
