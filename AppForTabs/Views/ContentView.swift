//
//  ContentView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var homeView = false
    var body: some View {
        if homeView == false{
            TutorialView(homeView: $homeView)
        }
        
        else{
            HomeView()
                .transition(.push(from: Edge.trailing))
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
