//
//  ImageUIElement.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ImageUIElement: View {
    @EnvironmentObject var nodeData: NodeData
    var imageIndex: Int

    var body: some View {
        let opacity: Double = getOpacityFromLinkedNodes(nodeData.imageNodes[imageIndex])

        return nodeData.imageNodes[imageIndex].image?
            .resizable()
            .scaledToFit()
            .padding()
            .opacity(opacity)
    }
}
