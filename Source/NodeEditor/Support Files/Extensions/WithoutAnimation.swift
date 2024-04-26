//
//  WithoutAnimation.swift
//  Draggy
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

// Extension for the View to not be affected by the animated value
extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
