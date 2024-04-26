//
//  UIKitExtension.swift
//  Draggy
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

// Extend UIColorWell to customize its behavior
// This extension is needed to present color picker as a sheet on click of the button
extension UIColorWell {

    // Override the didMoveToSuperview method to perform custom actions when the view is added to a superview
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()

        // Check if the view has been added to a superview
        if let uiButton = self.subviews.first?.subviews.last as? UIButton {
            // If the view contains a UIButton as its last subview, set up a closure to execute when needed
            UIColorWellHelper.helper.execute = {
                // Inside the closure, simulate a touchUpInside event on the UIButton
                uiButton.sendActions(for: .touchUpInside)
            }
        }
    }
}

// Create a helper class to manage the execution of actions related to UIColorWell
class UIColorWellHelper: NSObject {
    // Create a shared instance of the helper class using the singleton pattern
    static let helper = UIColorWellHelper()
    
    // Declare a closure property to hold the action to be executed
    var execute: (() -> ())?
    
    // Define a handler method to be called when an action is triggered
    @objc func handler(_ sender: Any) {
        // Execute the closure if it's not nil
        execute?()
    }
}
