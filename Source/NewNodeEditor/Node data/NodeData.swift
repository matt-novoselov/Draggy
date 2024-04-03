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
            
            // Remove the deleted node from the linkedNodes arrays of other nodes
            for selectedNode in nodes {
                selectedNode.linkedNodes.removeAll { $0.id == node.id }
            }
        }
    }
}

protocol NodeObject: Identifiable, AnyObject {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [Node] { get set }
    var availableForLinkingNodes: [Node.Type] { get }
    var uiNodeElement: any View {get}
    var uiPreviewElement: any View {get}
}

@Observable
class Node: NodeObject {
    var id: UUID = .init()
    var position: CGPoint
    var linkedNodes: [Node] = []
    var availableForLinkingNodes: [Node.Type]
    var uiNodeElement: any View = AnyView(EmptyView())
    var uiPreviewElement: any View = AnyView(EmptyView())
    
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = [],
        uiNodeElement: any View = AnyView(EmptyView()),
        uiPreviewElement: any View = AnyView(EmptyView())
    ) {
        self.position = position
        self.availableForLinkingNodes = availableForLinkingNodes
        self.uiNodeElement = uiNodeElement
        self.uiPreviewElement = uiPreviewElement
    }
    
    func addLinkedNode(_ node: Node) {
        withAnimation {
            linkedNodes.append(node)
        }
    }
    
    func replaceLinkedNode(_ node: Node, existingIndex: Int) {
        withAnimation {
            linkedNodes[existingIndex] = node
        }
    }
}

extension Node {

    func tryToLinkNode(_ node: Node, notificationsData: NotificationsData) {
        // Chek Node is not itself
        guard node.id != self.id else {
            return
        }
        
        // Check if Node of the type is not allowed for linking
        guard availableForLinkingNodes.contains(where: { $0 == type(of: node) }) else {
            notificationsData.add("Node of type \(type(of: node)) is not allowed for linking")
            return
        }
        
        // Add new Node
        guard let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) else {
            addLinkedNode(node)
            return
        }
        
        // Error: Can't replace Node
        guard type(of: node) == type(of: linkedNodes[existingIndex]) else {
            notificationsData.add("Cannot replace node: Types mismatch")
            return
        }
        
        // Replace node
        replaceLinkedNode(node, existingIndex: existingIndex)
    }
}

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
