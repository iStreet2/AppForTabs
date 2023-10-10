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
                                    VStack{
                                        Text("Vamos ver o que são ")
                                            .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                                            .foregroundStyle(Color("WeekOrange"))
                                        Text("TABLATURAS?")
                                            .font(.custom("SofiaSans-Regular", size:28).weight(.heavy))
                                            .foregroundStyle(Color("MediumOrange"))
                                    }
                                    .accessibilityElement(children: .combine)
                                    
                                    NavigationLink(destination: {
                                        ExplanationView(homeView: $homeView)
                                    }, label: {
                                        Text("Iniciar")
                                            .bold()
                                            .padding(.horizontal,25)
                                            .padding(.vertical,8)
                                            .foregroundStyle(Color("IniciarButton"))
                                            .background(Color("MediumOrange"))
                                            .cornerRadius(10)
                                            .font(.custom("SofiaSans-Regular", size:14))
                                            .accessibilityLabel("Iniciar explicação de tablaturas")
                                    })
                                    .padding(EdgeInsets())
                                    .padding()
                                    
                                }
                                Image("Tabsy")
                                    .accessibilityLabel("Nosso mascote Tabsy")
                                
                                
                            }
                            .padding(.horizontal)
                            .padding(.vertical,30 )
                            
                            
                            
                            Text("Atividades")
                                .padding(.vertical)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.title2)
                                .accessibilityLabel("Lista de Atividades")
                            
                            
                            LazyVStack {
                                VStack{
                                    
                                    //Atividade de Cordas
                                    NavigationLink{
                                        StringView(context: context, seeAgain: seeAgain)
                                        
                                    }label: {
                                        ActivityLinkView(text: vm.cardsHome[0].nome, color: vm.cardsHome[0].cor, locked: false)
                                    }
                                    
                                    //Atividade de Casas
                                    NavigationLink{
                                        FretView(frets: $frets, context: context, seeAgain: seeAgain)
                                    }label: {
                                        ActivityLinkView(text: vm.cardsHome[1].nome, color: vm.cardsHome[1].cor, locked: seeAgain.activitieDone < 1)
                                    }
                                    .disabled(seeAgain.activitieDone < 1)
                                    
                                    //Atividade de Afinação
                                    NavigationLink{
                                        //Banana
                                    }label: {
                                        ActivityLinkView(text: "Afinação (Sairá em Breve!)", color: vm.cardsHome[2].cor, locked: true)
                                    }
                                }
                                .disabled(true)
                                
                            }
                            
                            
                        }.padding([.trailing, .leading], 32)
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

//#Preview {
//    HomeView(homeView: .constant(true), context: NSManagedObjectContext(), tutorial: Tutorial(context: NSManagedObjectContext()))
//        .environmentObject(ViewModel())
//}
