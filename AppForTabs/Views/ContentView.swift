//
//  ContentView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = false
    var body: some View {
        if isShowing{
            TutorialView()
        }
        else{
            Button(action: {
                isShowing.toggle()
            }
                   , label: {
                Text("Começar App")
            })
        }
    }
    
}

#Preview {
    ContentView()
}
