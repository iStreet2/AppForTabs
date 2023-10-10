//
//  AppForTabsApp.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI
import Aptabase

@main
struct AppForTabsApp: App {
    @StateObject var vm = ViewModel()
    @StateObject var dataController = DataController()
    
    init() {
            Aptabase.shared.initialize(appKey: "A-EU-4995897190") // 👈 this is where you enter your App Key
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView(context: dataController.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(vm)
        }
    }
}
