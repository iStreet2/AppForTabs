//
//  TablatureView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct TablatureView: View {
    
    var musicName: String
    var tablature: String
    var standardTuning: [String] = ["E","B","G","D","A","E"]
    
    var body: some View {
        ZStack{
            VStack{
                Text(musicName)
                    .font(.custom("SofiaSans-Regular", size:18))
                    .foregroundStyle(.black)
                    .padding()
                    .padding(.bottom,50)
                Image(tablature)
                    .scaledToFit()
                    .accessibilityLabel("")
            }
            .padding()
            .accessibilityElement(children: .combine)
        }
        .background(.white)
    }
}

#Preview {
    TablatureView(musicName: "Brilha, Brilha Estrelinha",tablature: "Tablature1")
}
