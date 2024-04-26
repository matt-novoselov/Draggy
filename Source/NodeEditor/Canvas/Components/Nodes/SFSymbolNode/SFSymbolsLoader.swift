//
//  SFSymbolsLoader.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import Foundation

// Private function to retrieve SF Symbols from the CoreGlyphs bundle
private func getSFSymbols() -> [String] {
    // Attempt to locate the CoreGlyphs bundle
    guard let bundle = Bundle(identifier: "com.apple.CoreGlyphs") else {
        // If bundle not found, print an error message and return an empty array
        print("Error: Unable to locate bundle with identifier 'com.apple.CoreGlyphs'. Try loading any SF Symbol to the View before calling the function")
        return []
    }
    
    // Attempt to find the plist file containing symbol information
    guard let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist") else {
        // If plist file not found, print an error message and return an empty array
        print("Error: Plist file not found in bundle.")
        return []
    }
    
    // Attempt to load the plist file into a dictionary
    guard let plist = NSDictionary(contentsOfFile: resourcePath) else {
        // If unable to load plist file, print an error message and return an empty array
        print("Error: Unable to load plist file.")
        return []
    }
    
    // Attempt to extract symbols from the plist dictionary
    guard let plistSymbols = plist["symbols"] as? [String: String] else {
        // If unable to extract symbols, print an error message and return an empty array
        print("Error: Unable to extract symbols from plist.")
        return []
    }
    
    // Return an array containing only the keys (symbols) from the plist
    return Array(plistSymbols.keys)
}

// Public function to retrieve SF Symbols containing a specific search string
public func getSFSymbolsContaining(_ searchString: String) -> [String] {
    // Get all SF Symbols
    let allSymbols = getSFSymbols()
    
    // If search string is empty, return all symbols
    if searchString.isEmpty {
        return allSymbols
    }
    // Otherwise, filter symbols based on whether they contain the search string (case insensitive)
    else {
        return allSymbols.filter { symbol in
            symbol.localizedCaseInsensitiveContains(searchString)
        }
    }
}

