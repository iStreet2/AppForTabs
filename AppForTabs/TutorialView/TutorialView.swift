//
//  tutorialScreen1.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        VStack{
            VStack{
                Text("ISTO É UMA")
                    .font(.system(size:20))
                    .bold()
                Text("TABLATURA")
                    .font(.system(size:40))
                    .bold()
                    .foregroundColor(.accentColor)
                TablatureView(musicName:"Brilha, Brilha Estrelinha",tablature:"Tablature1")
                    .cornerRadius(40)
                    .shadow(radius: 10, y:10)
//                    .frame(width:40)
                    .padding()
            }
            .padding(.top)
            Spacer()
        }
    }
}

#Preview {
    TutorialView()
}
