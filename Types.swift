//
//  Types.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 21/03/24.
//

import Foundation

typealias NodeTypeList = Array<(any NodeObject).Type>

extension NodeTypeList {
    typealias ArrayLiteralElement = Any
}
