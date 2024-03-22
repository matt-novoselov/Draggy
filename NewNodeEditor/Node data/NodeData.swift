//
//  NodeData.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@Observable
class NodeData {
    var nodes: [any NodeObject] = []
    func deleteNode(_ node: any NodeObject) {
        withAnimation {
            nodes.removeAll { $0.id == node.id }
        }
    }
}

protocol NodeObject: Identifiable, AnyObject {
    
    associatedtype WrappedType
    
    var wrappedType: WrappedType.Type { get }
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [any NodeObject] { get set }
    var availableForLinkingNodes: [Any] { get set }
    var value: WrappedType? { get set }
}


@Observable
class Node<WrappedType>: NodeObject {
    
    var id: UUID = .init()
    var wrappedType: WrappedType.Type = WrappedType.self
    var position: CGPoint = .zero
    var linkedNodes: [any NodeObject] = []
    var availableForLinkingNodes: [Any] = []
    
    var value: WrappedType?
    
    static func getValue<Target>(as targetType: Target.Type, from nodes: any NodeObject) -> Target? {
        for node in nodes.linkedNodes {
            if node.wrappedType == Target.self {
                return node.value as? Target
            }
        }
        return nil
    }
    
}

//extension Node {
//    func addLinkedNode(_ node: Node) {
//        guard availableForLinkingNodes.contains(where: { $0 == type(of: node) }) else {
//            print("Node of type \(type(of: node)) is not allowed for linking")
//            return
//        }
//        
//        guard let existingIndex = linkedNodes.firstIndex(where: { type(of: $0) == type(of: node) }) else {
//            print("Added node of type \(type(of: node))")
//            linkedNodes.append(node)
//            return
//        }
//
//        guard type(of: node) == type(of: linkedNodes[existingIndex]) else {
//            print("Cannot replace node: Types mismatch")
//            return
//        }
//
//        print("Replaced node of type \(type(of: node))")
//        linkedNodes[existingIndex] = node
//    }
//}
