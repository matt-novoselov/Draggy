//
//  NodeData.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

// Define a class to hold data related to nodes
@Observable
class NodeData {
    var nodes: [Node] = [] // Array to hold nodes
}

// Protocol defining properties and behaviors for a node object
protocol NodeObject: Identifiable, AnyObject {
    var id: UUID { get } // Unique identifier for the node
    var position: CGPoint { get set } // Position of the node
    var linkedNodes: [Node] { get set } // Nodes linked to this node
    var linkedToNodes: [Node] { get set } // Nodes to which this node is linked
    var availableForLinkingNodes: [Node.Type] { get } // Types of nodes this node can be linked to
    var uiNodeElement: any View {get} // UI element representing the node
    var uiPreviewElement: any View {get} // Preview UI element representing the node
    var value: Any { get set } // Value associated with the node
}

// Define the Node class conforming to NodeObject protocol
@Observable
class Node: NodeObject {
    
    var id: UUID = .init() // Unique identifier for the node
    var position: CGPoint // Position of the node
    var linkedNodes: [Node] = [] // Nodes linked to this node
    var linkedToNodes: [Node] = [] // Nodes to which this node is linked
    var availableForLinkingNodes: [Node.Type] // Types of nodes this node can be linked to
    var uiNodeElement: any View = AnyView(EmptyView()) // UI element representing the node
    var uiPreviewElement: any View = AnyView(EmptyView()) // Preview UI element representing the node
    var value: Any // Value associated with the node
    
    // Initializer to create a node
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
    
    // Method to add a linked node to the current node
    func addLinkedNode(_ node: Node) {
        withAnimation {
            linkedNodes.append(node)
            node.linkedToNodes.append(self)
        }
    }
    
    // Method to replace a linked node at a specific index
    func replaceLinkedNode(_ node: Node, existingIndex: Int) {
        withAnimation {
            linkedNodes[existingIndex] = node
        }
    }
}

// Extension of Node class for additional functionality
extension Node {
    
    // Method to attempt linking a node
    func tryToLinkNode(_ node: Node, notificationsData: NotificationsData) {
        // Check if the node is not itself
        guard node.id != self.id else {
            return
        }
        
        // Check if the node type is allowed for linking
        guard availableForLinkingNodes.contains(where: { $0 == type(of: node) }) else {
            notificationsData.add("Node of type \(type(of: node)) is not allowed for linking")
            return
        }
        
        // Add new node if not already linked
        guard let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) else {
            addLinkedNode(node)
            return
        }
        
        // Error: Can't replace node if types mismatch
        guard type(of: node) == type(of: linkedNodes[existingIndex]) else {
            notificationsData.add("Cannot replace node: Types mismatch")
            return
        }
        
        // Replace node
        replaceLinkedNode(node, existingIndex: existingIndex)
    }
}

// Extension of Node class for parsing linked nodes
extension Node {
    
    // Method to parse linked nodes of a specific type
    func parseLinkedNodes(linkedNodeType: Node.Type) -> Node? {
        for linkedNode in self.linkedNodes {
            if type(of: linkedNode) == linkedNodeType {
                return linkedNode
            }
        }
        return nil
    }
    
    // Method to get value from linked node of a specific type
    func getValueFrom(_ linkedNodeType: Node.Type) -> Any? {
        if let selectedNode = parseLinkedNodes(linkedNodeType: linkedNodeType) {
            return selectedNode.value
        }
        return nil
    }
    
    // Method to get UI from linked node of a specific type
    func getUIFrom(_ linkedNodeType: Node.Type) -> Any? {
        if let selectedNode = parseLinkedNodes(linkedNodeType: linkedNodeType) {
            return selectedNode.uiPreviewElement
        }
        return nil
    }
}

// Extension of NodeData class for adding nodes
extension NodeData {
    
    // Method to add a new node
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

// Extension of NodeData class for deleting nodes
extension NodeData {
    
    // Method to delete an existing node
    func deleteNode(_ node: Node) {
        withAnimation {
            nodes.removeAll { $0.id == node.id }
            
            // Remove the deleted node from the linkedNodes arrays of other nodes
            for selectedNode in node.linkedToNodes {
                selectedNode.linkedNodes.removeAll { $0.id == node.id }
            }
        }
    }
}

// Extension of NodeData class for duplicating nodes
extension NodeData {
    
    // Method to duplicate an existing node
    func duplicateNode(_ node: Node) {
        let duplicatedNodePosition = CGPoint(x: node.position.x + 50, y: node.position.y - 50)
        
        addNode(type(of: node), position: duplicatedNodePosition, value: node.value)
    }
}
