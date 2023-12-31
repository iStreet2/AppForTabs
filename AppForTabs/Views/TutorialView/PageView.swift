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
    @State var scale = 0.1
    var labels = ["Imagem da tablatura da música Brilha Brilha Estrelinha","Imagem da tablatura da música Brilha Brilha Estrelinha","Imagem da tablatura da música Brilha Brilha Estrelinha com as cordas destacadas de azul,","Imagem da tablatura da música Brilha Brilha Estrelinha com as casas destacadas de rosa","Imagem da tablatura da música Brilha Brilha Estrelinha com a afinação destacada de verde","Imagem da tablatura da música Brilha Brilha Estrelinha com o tempo destacado de roxo"]
    var body: some View {
        Group{
            if page == 0{
                ScrollView{
                    VStack{
                        Group{
                            Text("ISTO É UMA")
                                .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                                .bold()
                            Text("TABLATURA")
                                .font(.custom("SofiaSans-Regular", size:40).weight(.heavy))
                                .bold()
                                .foregroundColor(.accentColor)
                        }
                        TablatureView(musicName:"Brilha, Brilha Estrelinha",tablature:"Tablature1")
                            .cornerRadius(40)
                            .shadow(radius:7, y:8)
                            .padding()
                            .accessibilityLabel(labels[0])
                            .accessibilityAddTraits(.isImage)
                    }
                    .accessibilityElement(children: .combine)
                    .padding()
                }
            }
            if page == 1{
                ScrollView{
                    VStack{
                        Group{
                            Text("VAMOS ") +
                            Text("LER ")
                                .foregroundColor(.accentColor)
                            + Text("JUNTOS?")
                        }
                        .font(.custom("SofiaSans-Regular", size:28).weight(.heavy))
                        .padding(.bottom, 5)
                        
                        Text("A tablatura é composta\npor alguns elementos")
                            .font(.custom("SofiaSans-Regular", size:16).weight(.light))
                            .multilineTextAlignment(.center)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha", tablature: "Tablature2")
                            .cornerRadius(40)
                            .shadow(radius: 10, y: 10)
                            .padding()
                            .accessibilityLabel(labels[1])
                            .accessibilityAddTraits(.isImage)
                    }
                  .accessibilityElement(children: .combine)
                  .padding()
                }
                
            }
            if page == 2{

                ScrollView{
                    VStack{
                        Text("CORDAS")
                            .font(.custom("SofiaSans-Regular", size:32).weight(.heavy))
                            .foregroundColor(.blue)
                            .padding(.bottom, 5)
                        
                        Text("Linhas que representam as\n cordas do instrumento")
                            .font(.custom("SofiaSans-Regular", size:16).weight(.light))
                            .multilineTextAlignment(.center)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha", tablature: "Tablature3")
                            .cornerRadius(40)
                            .shadow(radius: 10, y: 10)
                            .padding()
                            .accessibilityLabel(labels[2])
                            .accessibilityAddTraits(.isImage)
                    }
                  .accessibilityElement(children: .combine)
                  .padding()
                }
                
            }
            if page == 3{
                ScrollView{
                    VStack{
                        Text("CASAS")
                            .font(.custom("SofiaSans-Regular", size:32).weight(.heavy))
                            .foregroundColor(Color(red: 1, green: 0, blue: 0.31))
                            .padding(.bottom, 5)
                        
                        Text("Números que correspondem às\n casas que devem ser tocadas")
                            .font(.custom("SofiaSans-Regular", size:16).weight(.light))
                            .multilineTextAlignment(.center)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha", tablature: "Tablature4")
                            .cornerRadius(40)
                            .shadow(radius: 10, y: 10)
                            .padding()
                            .accessibilityLabel(labels[3])
                            .accessibilityAddTraits(.isImage)
                    }
                    .accessibilityElement(children: .combine)
                    .padding()
                }
            }
            if page == 4{
                ScrollView{
                    VStack{
                        Text("AFINAÇÃO")
                            .font(.custom("SofiaSans-Regular", size:32).weight(.heavy))
                            .foregroundColor(.green)
                            .padding(.bottom, 5)
                        
                        Text("Indica os sons emitidos pelas cordas,\n correspondendo a uma nota")
                            .font(.custom("SofiaSans-Regular", size:16).weight(.light))
                            .multilineTextAlignment(.center)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha", tablature: "Tablature5")
                            .cornerRadius(40)
                            .shadow(radius: 10, y: 10)
                            .padding()
                            .accessibilityLabel(labels[4])
                            .accessibilityAddTraits(.isImage)
                    }
                    .accessibilityElement(children: .combine)
                    .padding()
                  
                }
            }
            if page == 5{
                ScrollView{
                    VStack{
                        Text("TEMPO")
                            .font(.custom("SofiaSans-Regular", size:32).weight(.heavy))
                            .foregroundColor(Color(red: 0.45, green: 0.31, blue: 0.96))
                            .padding(.bottom, 5)
                        
                        Text("Aponta quantas batidas ocorrem\n dentro de uma secção de música")
                            .font(.custom("SofiaSans-Regular", size:16).weight(.light))
                            .multilineTextAlignment(.center)
                        TablatureView(musicName:"Brilha, Brilha Estrelinha", tablature: "Tablature6")
                            .cornerRadius(40)
                            .shadow(radius: 10, y: 10)
                            .padding()
                            .accessibilityLabel(labels[5])
                            .accessibilityAddTraits(.isImage)
                    }
                      .accessibilityElement(children: .combine)
                    .padding()

                }
            }
            
        }
        .scaleEffect(scale) //Código da amimação
        .onAppear{
            withAnimation() {
                scale = 1
            }
        }
    }
}

#Preview {
    PageView(page: 1)
}
