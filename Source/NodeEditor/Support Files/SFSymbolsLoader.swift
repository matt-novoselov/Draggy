//
//  SFSymbolsLoader.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import Foundation

public func getSFSymbols() -> [String]{
    if let bundle = Bundle(identifier: "com.apple.CoreGlyphs") {
        if let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist") {
            if let plist = NSDictionary(contentsOfFile: resourcePath) {
                if let plistSymbols = plist["symbols"] as? [String: String] {
                    return Array(plistSymbols.keys)
                } else {
                    print("Error: Unable to extract symbols from plist.")
                }
            } else {
                print("Error: Unable to load plist file.")
            }
        } else {
            print("Error: Plist file not found in bundle.")
        }
    } else {
        print("Error: Unable to locate bundle with identifier 'com.apple.CoreGlyphs'.")
    }
    
    return []
}
