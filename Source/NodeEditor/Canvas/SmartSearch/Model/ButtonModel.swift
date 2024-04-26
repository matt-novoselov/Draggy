//
//  ButtonModel.swift
//  Draggy
//
//  Created by Matt Novoselov on 08/04/24.
//

import Foundation

//
// Node Category can either be "Components" or "Effects"
//
// Components are standalone nodes that can be displayed in preview independently
// Example of Component:
// • Text
// • Image
// • Button
//
// Effects are nodes that can be applied to Components and can not be displayed independently
// Example of Effects:
// • Opacity
// • Color
// • Rotation

enum NodeCategory: CaseIterable {
    case component
    case effect
    
    // Text title for Smart Search
    var title: String {
        switch self {
        case .component:
            return "Components"
        case .effect:
            return "Effects"
        }
    }
}

// Each button for Smart Search should contain Node Type, Category, Title, Icon Name and keywords
struct ButtonItem: Identifiable {
    let id = UUID()
    let nodeType: Node.Type // Type of the Node
    let nodeCategory: NodeCategory // Component or Effect
    let title: String // Title of the button
    let iconName: String // SF Symbol that is displayed in the list view
    let keywords: [String] // Keywords to search. For example "opacity" node can also be found by the keyword "transparency"
}
