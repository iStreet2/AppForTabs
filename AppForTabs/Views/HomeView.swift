//
//  HomeView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 25/09/23.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Binding var homeView: Bool
    @State var frets = [false,false,false,false,false]
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context //Data Controller
    
    var tutorial: Tutorial
    var seeAgain: SeeAgain
    
    @ObservedObject var tutorialController: TutorialController
    @ObservedObject var seeAgainController: SeeAgainController
    
    
    init(homeView: Binding <Bool>, context: NSManagedObjectContext, tutorial: Tutorial, seeAgain: SeeAgain) {
        self.tutorialController = TutorialController(context: context)
        self.seeAgainController = SeeAgainController(context: context)
        self.tutorial = tutorial
        self.seeAgain = seeAgain
        self._homeView = homeView
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    ZStack{
                        Circle()
                            .fill(Color("CircleHome"))
                            .offset(x:-70, y: -300)
//                            .frame(width: 491, height: 491)
                        VStack(alignment: .leading, spacing: 0){
                            HStack(alignment: .center){
                                Text("Olá, sou o Tabsy!")
                                    .font(.title)
                                    .bold()
                                    
                                    .padding(.leading)
                            }
            
                                HStack{
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Vamos ver o que são ")
                                            .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                                            .foregroundStyle(Color("MediumOrange"))
                                        Text("TABLATURAS?")
                                            .font(.custom("SofiaSans-Regular", size:28).weight(.heavy))
                                            .foregroundStyle(Color("StrongOrange"))
                                        
                                        NavigationLink(destination: {
                                            ExplanationView(homeView: $homeView)
                                        }, label: {
                                            Text("Iniciar")
                                                .bold()
                                                .padding(.horizontal,25)
                                                .padding(.vertical,8)
                                                .foregroundStyle(Color("IniciarButton"))
                                            //                                            .frame(width: 114 , height: 35)
                                                .background(Color("MediumOrange"))
                                                .cornerRadius(10)
                                                .font(.custom("SofiaSans-Regular", size:14))
                                        }).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                                        //                                   .padding(.bottom, 150)
                                                                          .padding()
                                        
                                        
                                       
                                        
                                        
                                    }
                                    Image("Tabsy")
                                
                                
                            }
                            .padding(.horizontal)
                            .padding(.vertical,30 )
                            
                            
                            
                            Text("Atividades")
                                .padding(.vertical)
                                .bold()
                                .padding(.horizontal, 20)

                                .font(.title2)
                                .accessibilityLabel("Lista de Atividades")
   
                            
                            VStack{
                                VStack{
                                    NavigationLink{
                                        StringView(context: context, seeAgain: seeAgain)
                                        
                                    }label: {
                                        ZStack{
                                            Rectangle()
                                                .fill(vm.cardsHome[0].cor)
                                                .cornerRadius(18)
                                            HStack{
                                                Text("\(vm.cardsHome[0].nome)")
                                                    .bold()
                                                    .foregroundStyle(.white)
                                                    .font(.custom("SofiaSans-Regular", size:21))
                                                Spacer()
                                            }
                                            .padding()
                                            .padding(.horizontal,30)
                                        }
                                        .frame(width: 321, height: 115)
                                        .padding(.leading)
                                        .padding(.top,5)
                                        .accessibilityLabel("Atividade de cordas")
                                    }
                                    
                                    NavigationLink{
                                        FretView(frets: $frets, context: context, seeAgain: seeAgain)
                                    }label: {
                                        if seeAgain.activitieDone < 1{
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color("BlockedRectangle"))
                                                    .cornerRadius(18)
                                                HStack{
                                                    Text("\(vm.cardsHome[1].nome)")
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
                                            .padding(.leading)
                                            .padding(.top,5)
                                            .accessibilityLabel("Atividade de Casas bloqueada, complete a de Cordas primeiro")
                                        }
                                        else{
                                            ZStack{
                                                Rectangle()
                                                    .fill(vm.cardsHome[1].cor)
                                                    .cornerRadius(18)
                                                HStack{
                                                    Text("\(vm.cardsHome[1].nome)")
                                                        .bold()
                                                        .foregroundStyle(.white)
                                                        .font(.custom("SofiaSans-Regular", size:21))
                                                    Spacer()
                                                }
                                                .padding()
                                                .padding(.horizontal,30)
                                            }
                                            .frame(width: 321, height: 115)
                                            .padding(.leading)
                                            .padding(.top,5)
                                            .accessibilityLabel("Atividade de casas")
                                        }
                                    }
                                    .disabled(seeAgain.activitieDone < 1)
                                    
                                    
                                    NavigationLink{
                                        //Banana
                                    }label: {
//                                        if seeAgain.activitieDone < 2{
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color("BlockedRectangle"))
                                                    .cornerRadius(18)
                                                HStack{
                                                    Text("\(vm.cardsHome[2].nome) (Em Breve!)")
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
                                            .padding(.leading)
                                            .padding(.top,5)
                                            .accessibilityLabel("Atividade de Afinação, sairá em breve!")
//                                        }
//                                        else{
//                                            ZStack{
//                                                Rectangle()
//                                                    .fill(Color("BlockedRectangle"))
//                                                    .cornerRadius(18)
//                                                HStack{
//                                                    Text("\(vm.cardsHome[2].nome) (Em Breve!)")
//                                                        .bold()
//                                                        .foregroundStyle(.white)
//                                                        .font(.custom("SofiaSans-Regular", size:21))
//                                                    Spacer()
//                                                    Image(systemName: "lock.fill")
//                                                        .font(.system(size:40))
//                                                    
//                                                }
//                                                .padding()
//                                                .padding(.horizontal,30)
//                                            }
//                                            .frame(width: 321, height: 115)
//                                            .padding(.leading)
//                                            .padding(.top,5)
//                                            .accessibilityLabel("Atividade de Afinação, sairá em breve!")
//                                            
//                                        }
                                    }
                                    .disabled(true)
                                    
                                }
                                
                                
                            }
                        }
                    }
                }
                Spacer()
            }
            .toolbar{
                NavigationLink {
                    TutorialView(homeView: $homeView, context: context, tutorial: tutorial)
                } label: {
                    Image(systemName: "questionmark.circle")
                        .accessibilityLabel("Rever tutorial inicial")
                }
            }
            
        }
    }
}

//#Preview {
//    HomeView(homeView: .constant(true), context: NSManagedObjectContext(), tutorial: Tutorial(context: NSManagedObjectContext()))
//        .environmentObject(ViewModel())
//}
