//
//  NodeData.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

class NodeData: ObservableObject {
    @Published var colorNodes: [ColorNode] = []
    @Published var textNodes: [TextNode] = []
    @Published var opacityNodes: [OpacityNode] = []
    @Published var imageNodes: [ImageNode] = []
}

protocol Node: Identifiable {
    var id: UUID { get }
    var position: CGPoint { get set }
    var linkedNodes: [any Node] { get set }
}

extension Node{
    mutating func addLinkedNode(_ node: any Node) {
        linkedNodes.append(node)
    }
}

