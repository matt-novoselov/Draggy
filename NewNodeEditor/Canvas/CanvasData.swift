//
//  CanvasData.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

// Define a class to hold your shared data
class DataModel: ObservableObject {
    @Published var value: Int = 0
}

//import SwiftUI
//
//// Define a class to hold your shared data
//class DataModel: ObservableObject {
//    @Published var value: Int = 0
//}
//
//// Define your views
//struct ContentView: View {
//    var body: some View {
//        // Provide the DataModel as an environment object
//        View3().environmentObject(DataModel())
//    }
//}
//
//struct View3: View {
//    @EnvironmentObject var dataModel: DataModel
//
//    var body: some View {
//        VStack {
//            View1()
//            View2()
//        }
//    }
//}
//
//struct View1: View {
//    @EnvironmentObject var dataModel: DataModel
//
//    var body: some View {
//        // Access and modify dataModel.value as needed
//        Text("Value in View1: \(dataModel.value)")
//    }
//}
//
//struct View2: View {
//    @EnvironmentObject var dataModel: DataModel
//
//    var body: some View {
//        // Access and modify dataModel.value as needed
//        Text("Value in View2: \(dataModel.value)")
//    }
//}
//
