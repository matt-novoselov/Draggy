//
//  SFSymbolsLoader.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import Foundation

private func getSFSymbols() -> [String] {
    guard let bundle = Bundle(identifier: "com.apple.CoreGlyphs") else {
        print("Error: Unable to locate bundle with identifier 'com.apple.CoreGlyphs'. Try loading any SF Symbol to the View before calling the function")
        return []
    }
    
    guard let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist") else {
        print("Error: Plist file not found in bundle.")
        return []
    }
    
    guard let plist = NSDictionary(contentsOfFile: resourcePath) else {
        print("Error: Unable to load plist file.")
        return []
    }
    
    guard let plistSymbols = plist["symbols"] as? [String: String] else {
        print("Error: Unable to extract symbols from plist.")
        return []
    }
    
    return Array(plistSymbols.keys)
}

public func getSFSymbolsContaining(_ searchString: String) -> [String] {
    
    let allSymbols = getSFSymbols()
    
    if searchString.isEmpty {
        return allSymbols
    }
    else {
        return allSymbols.filter { symbol in
            symbol.localizedCaseInsensitiveContains(searchString)
        }
    }
}
