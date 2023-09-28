//
//  HomeView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 25/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView(){
                VStack(alignment: .leading){
                    Text("Início")
                        .padding(.leading, 20)
                        .font(.system(size: 32))
                        .bold()
                    VStack(alignment: .leading) {
                        Text("Mas antes, \no que são")
                            .font(.custom("SofiaSans-Regular", size:20))
                            .fontWeight(.black)
                            .foregroundColor(.gray)
                        Text("TABLATURAS?")
                            .fontWeight(.black)
                            .font(.custom("SofiaSans-Regular", size:28))
                        Button(action: {}) {
                            Text("Iniciar")
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 114 , height: 35)
                                .background(.orange)
                                .cornerRadius(10)
                                .font(.custom("SofiaSans-Regular", size:14))
                            
                            
                            
                        }.padding(.top)
                    }.padding(.trailing, 50)
                        .frame(width: 319 , height: 226)
                        .background(Color("Laranja"))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                    
                    
                    
                    
                    Text("Atividades")
                        .bold()
                        .padding(.horizontal, 20)
                        .font(.system(size:22))
                    
                    
                    VStack{
                        ForEach(0 ..< vm.cardsHome.count, id: \.self){ cardHome in
                            VStack{
                                NavigationLink {
                                    Text("teste")
                                } label: {
                                    
                                    VStack{
                                        Text(vm.cardsHome[cardHome].nome)
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.custom("SofiaSans-Regular", size:21))
                                            .padding(.trailing, 150)
                                            
                                    }
                                    .frame(width: 321 , height: 115 )
                                    .background(vm.cardsHome[cardHome].cor)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                                    
                                    
                                }
                            }
                            
                            
                        }
                        
                    }
                }
    
                //.navigationTitle("Início")
            }
                    
            Spacer()
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(ViewModel())
}
