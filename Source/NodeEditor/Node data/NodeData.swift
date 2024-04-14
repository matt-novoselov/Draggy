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
}

protocol NodeObject: Identifiable, AnyObject {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [Node] { get set }
    var linkedToNodes: [Node] { get set }
    var availableForLinkingNodes: [Node.Type] { get }
    var uiNodeElement: any View {get}
    var uiPreviewElement: any View {get}
    var value: Any { get set }
}

@Observable
class Node: NodeObject {
    
    var id: UUID = .init()
    var position: CGPoint
    var linkedNodes: [Node] = []
    var linkedToNodes: [Node] = []
    var availableForLinkingNodes: [Node.Type]
    var uiNodeElement: any View = AnyView(EmptyView())
    var uiPreviewElement: any View = AnyView(EmptyView())
    var value: Any
    
    required init(
        position: CGPoint = .zero,
        availableForLinkingNodes: [Node.Type] = [],
        uiNodeElement: any View = AnyView(EmptyView()),
        uiPreviewElement: any View = AnyView(EmptyView()),
        value: Any = AnyView(EmptyView())
    ) {
        self.position = position
        self.availableForLinkingNodes = availableForLinkingNodes
        self.uiNodeElement = uiNodeElement
        self.uiPreviewElement = uiPreviewElement
        self.value = value
    }
    
    func addLinkedNode(_ node: Node) {
        withAnimation {
            linkedNodes.append(node)
            node.linkedToNodes.append(self)
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
    
    func getValueFrom(_ linkedNodeType: Node.Type) -> Any?{
        
        if let selectedNode = parseLinkedNodes(linkedNodeType: linkedNodeType){
            return selectedNode.value
        }
        
        return nil
    }
    
    func getUIFrom(_ linkedNodeType: Node.Type) -> Any?{
        
        if let selectedNode = parseLinkedNodes(linkedNodeType: linkedNodeType){
            return selectedNode.uiPreviewElement
        }
        
        return nil
    }
}

// Add new Node
extension NodeData {
    func addNode(_ nodeType: Node.Type, position: CGPoint, value: Any? = nil) {
        withAnimation {
            if let value = value {
                nodes.append(nodeType.init(position: position, value: value))
            } else {
                nodes.append(nodeType.init(position: position))
            }
        }
    }
}

// Delete existing Node
extension NodeData {
    func deleteNode(_ node: Node) {
        withAnimation {
            nodes.removeAll { $0.id == node.id }
            
            // Remove the deleted node from the linkedNodes arrays of other nodes
            for selectedNode in node.linkedToNodes{
                selectedNode.linkedNodes.removeAll { $0.id == node.id }
            }
        }
    }
}

// Duplicate existing Node
extension NodeData {
    func duplicateNode(_ node: Node) {
        let duplicatedNodePosition = CGPoint(x: node.position.x + 50, y: node.position.y - 50)
        
        addNode(type(of: node), position: duplicatedNodePosition, value: node.value)
    }
}
