//
//  ContentView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.custom("SofiaSans-Regular",size:50))
            Text("bia slay")
            Text("Bonito passou por aqui!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
