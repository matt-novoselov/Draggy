//
//  WithoutAnimation.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
