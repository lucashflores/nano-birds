//
//  Nano3App.swift
//  Nano3
//
//  Created by Lucas Flores on 26/09/23.
//

import SwiftUI
import CoreData

@main
struct Nano3App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
