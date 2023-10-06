//
//  AppForTabsApp.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

@main
struct AppForTabsApp: App {
    @StateObject var vm = ViewModel()
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(context: dataController.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(vm)
        }
    }
}
