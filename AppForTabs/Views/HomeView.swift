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
            VStack(alignment: .leading){
                Text("O que é?")
                    .frame(width: 341 , height: 140)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius: 5)
                
                Text("Atividades")
                    .font(.system(size: 22))
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
                
                HStack{
                    ForEach(0 ..< vm.cardsHome.count, id: \.self){ cardHome in
                        VStack{
                            NavigationLink {
                                Text("teste")
                            } label: {
                                
                                VStack{
                                    Text(vm.cardsHome[cardHome].nome)
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                    Text(vm.cardsHome[cardHome].descricao)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12))
                                }
                                .padding(.top)
                                .frame(width: 151 , height: 217 )
                                .background(Color.white)
                                .cornerRadius(15)
                                .padding()
                                .shadow(radius: 5)
                                
                            }
                        }
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Tablatura")

                    
            Spacer()
        }
        
        Divider()
            .padding()
    }
}


#Preview {
    HomeView()
        .environmentObject(ViewModel())
}
