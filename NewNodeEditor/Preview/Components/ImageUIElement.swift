//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    var imageNode: ImageNode

    var body: some View {
        let opacity = getOpacityFromLinkedNodes(imageNode)

        return imageNode.image?
            .resizable()
            .scaledToFit()
            .padding()
            .opacity(opacity)
    }
}
