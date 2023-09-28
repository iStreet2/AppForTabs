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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
