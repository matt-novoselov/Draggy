//
//  BlurMaterial.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 05/04/24.
//

import SwiftUI

// Define a new struct named BlurView
struct BlurView: UIViewRepresentable {

    let style: UIBlurEffect.Style
    let color: Color? // Optional property for custom blur color

    init(style: UIBlurEffect.Style, color: Color? = nil) {
        self.style = style
        self.color = color
    }

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)

        // Create a UIVisualEffectView with the blur effect
        let blurView = UIVisualEffectView(effect: blurEffect)

        // If a custom color is provided, apply it as a tint to the view
        if let color = color {
            blurView.contentView.backgroundColor = UIColor(color.opacity(0.5))
        }

        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // Not required in this case, but can be used if the blur style or color needs to be dynamically updated
    }
}
