//
//  Page1.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 26/09/23.
//

import SwiftUI

struct PageView: View, Identifiable {
    var id = UUID()
    @State var page: Int
    @State var scale = 0.5
    var body: some View {
        Group{
            if page == 0{
                VStack{
                    VStack{
                        Text("ISTO É UMA")
                            .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                            .bold()
                        Text("TABLATURA")
                            .font(.custom("SofiaSans-Regular", size:40).weight(.heavy))
                            .bold()
                            .foregroundColor(.accentColor)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha",tablature:"Tablature1")
                            .cornerRadius(40)
                            .shadow(radius: 10, y:10)
                            .padding()
                    }
                }
                .padding()
                .background()
                .cornerRadius(100)
            }
            if page == 1{
                Text("André Faz Legal")
            }
            if page == 2{
                Text("André Faz Legal")
            }
            if page == 3{
                Text("André Faz Legal")
            }
            if page == 4{
                Text("André Faz Legal")
            }
            if page == 5{
                Text("André Faz Legal")
            }
            
        }
        .scaleEffect(scale) //Código da amimação
        .onAppear{
//            _ = Animation.easeInOut(duration: 1)
            //let repeated = baseAnimation.repeatForever(autoreverses: true)
            withAnimation() {
                scale = 1
            }
        }
    }
}

#Preview {
    PageView(page: 0)
}
