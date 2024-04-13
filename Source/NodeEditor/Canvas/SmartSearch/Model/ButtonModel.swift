//
//  ButtonModel.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 08/04/24.
//

import Foundation


enum NodeCategory: CaseIterable {
    case component
    case effect
    
    var title: String {
        switch self {
        case .component:
            return "Components"
        case .effect:
            return "Effects"
        }
    }
}

struct ButtonItem: Identifiable {
    let id = UUID()
    let nodeType: Node.Type
    let nodeCategory: NodeCategory
    let title: String
    let iconName: String
    let keywords: [String]
}
