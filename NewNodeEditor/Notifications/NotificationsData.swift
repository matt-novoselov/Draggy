//
//  NotificationsData.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

@Observable
class NotificationsData {
    var displayed: [String] = []
    
    func add(_ text: String){
        withAnimation{
            displayed.append(text)
        }
    }
}
