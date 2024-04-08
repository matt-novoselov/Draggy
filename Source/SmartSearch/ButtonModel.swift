//
//  ButtonModel.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 08/04/24.
//

import Foundation

struct ButtonItem: Identifiable {
    let id = UUID()
    let nodeType: Node.Type
    let title: String
    let iconName: String
    let keywords: [String]
}
