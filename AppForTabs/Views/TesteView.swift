//
//  TesteView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 09/10/23.
//

import SwiftUI

struct TesteView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Binding var homeView: Bool
    @State var frets = [false,false,false,false,false]
    
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    ZStack{
                        Circle()
                            .fill(Color("CircleHome"))
//                            .frame(width: 491, height: 491)
                            .offset(x:-100, y: -380)
                            
                        VStack(alignment: .leading){
                            HStack(alignment: .center){
                                Text("Olá, sou o Tabsy!")
                                    .font(.title)
                                    .bold()
                                    .padding(.bottom)
                                    .padding(.leading)
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Vamos ver o que são ")
                                    .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                                    .foregroundStyle(Color("MediumOrange"))
                                Text("TABLATURAS?")
                                    .font(.custom("SofiaSans-Regular", size:28).weight(.heavy))
                                    .foregroundStyle(Color("MediumOrange"))
                                
                                HStack{
                                    NavigationLink(destination: {
                                    }, label: {
                                        Text("Iniciar")
                                            .bold()
                                            .padding()
                                            .foregroundStyle(Color("IniciarButton"))
                                        //                                            .frame(width: 114 , height: 35)
                                            .background(Color("MediumOrange"))
                                            .cornerRadius(10)
                                            .font(.custom("SofiaSans-Regular", size:14))
                                    })
//                                    .padding(.bottom, 100)
                                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                                    
                                    Image("Tabsy")
                                    
                                }
                                
                            }
                            .padding(.horizontal)
                            
                            
                            
                            Text("Atividades")
                                .padding(.top)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.system(size:22))
                            
                            
                            HStack{
                                Spacer()
                                VStack{
                                    ForEach(0 ..< vm.cardsHome.count, id: \.self){ cardHome in
                                        VStack{
                                            if cardHome == 0{
                                                NavigationLink{
                                                    
                                                }label: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(vm.cardsHome[cardHome].cor)
                                                            .cornerRadius(18)
                                                        HStack{
                                                            Text("\(vm.cardsHome[cardHome].nome)")
                                                                .bold()
                                                                .foregroundStyle(.white)
                                                                .font(.custom("SofiaSans-Regular", size:21))
                                                            Spacer()
                                                        }
                                                        .padding()
                                                        .padding(.horizontal,30)
                                                    }
                                                    .frame(width: 321, height: 115)
//                                                    .padding(.leading)
                                                    .padding(.top,5)
                                                }
                                            }
                                            else if cardHome == 1{
                                                NavigationLink{
                                                }label: {
                                                    //                                                if seeAgain.activitieDone < 1{
                                                    //                                                    ZStack{
                                                    //                                                        Rectangle()
                                                    //                                                        .fill(Color("BlockedRectangle"))
                                                    //                                                        .cornerRadius(18)
                                                    //                                                        HStack{
                                                    //                                                            Text("\(vm.cardsHome[cardHome].nome)")
                                                    //                                                                .bold()
                                                    //                                                                .foregroundStyle(.white)
                                                    //                                                                .font(.custom("SofiaSans-Regular", size:21))
                                                    //                                                            Spacer()
                                                    //                                                            Image(systemName: "lock.fill")
                                                    //                                                                .font(.system(size:40))
                                                    //                                                                .foregroundStyle(.gray)
                                                    //                                                        }
                                                    //                                                        .padding()
                                                    //                                                        .padding(.horizontal,30)
                                                    //                                                    }
                                                    //                                                    .frame(width: 321, height: 115)
                                                    //                                                    .padding(.leading)
                                                    //                                                    .padding(.top,5)
                                                    //                                                }
                                                    //                                                else{
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(vm.cardsHome[cardHome].cor)
                                                            .cornerRadius(18)
                                                        HStack{
                                                            Text("\(vm.cardsHome[cardHome].nome)")
                                                                .bold()
                                                                .foregroundStyle(.white)
                                                                .font(.custom("SofiaSans-Regular", size:21))
                                                            Spacer()
                                                        }
                                                        .padding()
                                                        .padding(.horizontal,30)
                                                    }
                                                    .frame(width: 321, height: 115)
//                                                    .padding(.leading)
                                                    .padding(.top,5)
                                                    //                                                }
                                                }
                                                //                                            .disabled(seeAgain.activitieDone < 1)
                                            }
                                            
                                            else if cardHome == 2{
                                                NavigationLink{
                                                    //Banana
                                                }label: {
                                                    //                                                if seeAgain.activitieDone < 2{
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color("BlockedRectangle"))
                                                            .cornerRadius(18)
                                                        HStack{
                                                            Text("\(vm.cardsHome[cardHome].nome) (Em Breve!)")
                                                                .bold()
                                                                .foregroundStyle(.white)
                                                                .font(.custom("SofiaSans-Regular", size:21))
                                                            Spacer()
                                                            
                                                            Image(systemName: "lock.fill")
                                                                .font(.system(size:40))
                                                            
                                                            
                                                        }
                                                        .padding()
                                                        .padding(.horizontal,30)
                                                    }
                                                    .frame(width: 321, height: 115)
//                                                    .padding(.leading)
                                                    .padding(.top,5)
                                                    //                                                }
                                                    //                                                else{
                                                    //                                                    ZStack{
                                                    //                                                        Rectangle()
                                                    //                                                        .fill(Color("BlockedRectangle"))
                                                    //                                                        .cornerRadius(18)
                                                    //                                                        HStack{
                                                    //                                                            Text("\(vm.cardsHome[cardHome].nome) (Em Breve!)")
                                                    //                                                                .bold()
                                                    //                                                                .foregroundStyle(.white)
                                                    //                                                                .font(.custom("SofiaSans-Regular", size:21))
                                                    //                                                            Spacer()
                                                    //                                                                Image(systemName: "lock.fill")
                                                    //                                                                    .font(.system(size:40))
                                                    //
                                                    //                                                        }
                                                    //                                                        .padding()
                                                    //                                                        .padding(.horizontal,30)
                                                    //                                                    }
                                                    //                                                    .frame(width: 321, height: 115)
                                                    //                                                    .padding(.leading)
                                                    //                                                    .padding(.top,5)
                                                    //
                                                    //                                                }
                                                }
                                                .disabled(true)
                                            }
                                        }
                                    }
                                    
                                }
                                Spacer()
                            }}
                    }
                }
                Spacer()
            }
            .toolbar{
                NavigationLink {
                } label: {
                    Image(systemName: "questionmark.circle")
                }
            }
        }
    }

    
}

struct TesteView_Previews: PreviewProvider {
    static var previews: some View{
        TesteView(homeView: .constant(true))
            .environmentObject(ViewModel())
    }
}




