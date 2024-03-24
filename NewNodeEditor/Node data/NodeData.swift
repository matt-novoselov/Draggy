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

protocol NodeObject: Identifiable, AnyObject {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [Node] { get set }
    var availableForLinkingNodes: [Node.Type] { get }
}

@Observable
class Node: NodeObject {
    var id: UUID = .init()
    var position: CGPoint
    var linkedNodes: [Node] = []
    var availableForLinkingNodes: [Node.Type]
    
    // MARK:
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = []
    ) {
        self.position = position
        self.availableForLinkingNodes = availableForLinkingNodes
    }
}

// MARK:
extension Node {

    func addLinkedNode(_ node: Node, notificationsData: NotificationsData) {
        guard availableForLinkingNodes.contains(where: { $0 == type(of: node) }) else {
            notificationsData.displayedNotifications.append("Node of type \(type(of: node)) is not allowed for linking")
            return
        }
        
        guard let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) else {
            notificationsData.displayedNotifications.append("Added node of type \(type(of: node))")
            linkedNodes.append(node)
            return
        }
        
        guard type(of: node) == type(of: linkedNodes[existingIndex]) else {
            notificationsData.displayedNotifications.append("Cannot replace node: Types mismatch")
            return
        }
        
        notificationsData.displayedNotifications.append("Replaced node of type \(type(of: node))")
        linkedNodes[existingIndex] = node
    }
}

// MARK:
extension Node {
    func parseLinkedNodes(linkedNodeType: Node.Type) -> Node?{
        for linkedNode in self.linkedNodes {
            if type(of: linkedNode) == linkedNodeType {
                return linkedNode
            }
        }
        return nil
    }
}
