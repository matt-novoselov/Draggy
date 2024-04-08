//
//  ButtonViewModel.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 08/04/24.
//

import Foundation

class ButtonListViewModel{
    var buttons:[ButtonItem] = [
        ButtonItem(nodeType: TextNode.self, title: "Text", iconName: "text.word.spacing", keywords: ["text", "string", "typography", "font", "paragraph"]),
        ButtonItem(nodeType: ImageNode.self, title: "Image", iconName: "photo.fill", keywords: ["image", "photo", "photograph", "graphic", "illustration", "picture"]),
        ButtonItem(nodeType: ColorNode.self, title: "Color", iconName: "paintpalette.fill", keywords: ["color", "paint", "palette"]),
        ButtonItem(nodeType: OpacityNode.self, title: "Opacity", iconName: "rectangle.checkered", keywords: ["opacity", "transparent", "transparency", "opaque", "fade", "see-through"]),
        ButtonItem(nodeType: RotationNode.self, title: "Rotation", iconName: "arrow.clockwise", keywords: ["rotation", "clockwise", "spin"]),
        ButtonItem(nodeType: CornerRadiusNode.self, title: "Corner Radius", iconName: "viewfinder", keywords: ["corner", "radius", "edges", "bevel", "rounded"]),
        ButtonItem(nodeType: ShadowNode.self, title: "Shadow", iconName: "shadow", keywords: ["shadow", "shade", "silhouette", "darkness"])
    ]
    
    // Function to filter buttons based on search text
    func filtered(_ searchText: String) -> [ButtonItem] {
        if searchText.isEmpty {
            return buttons
        } else {
            return buttons.filter { button in
                button.title.localizedCaseInsensitiveContains(searchText) ||
                button.keywords.contains { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }
}
