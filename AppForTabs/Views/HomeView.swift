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
    @State var bounceHeight: BounceHeight? = nil
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
                            .fill(Color("OrangeBackground"))
                            .offset(x:-100, y: -380)
                            .frame(width: 491, height: 491)
                        VStack(alignment: .leading){
                            HStack(alignment: .center){
                                Text("Olá, sou o Tabsy!")
                                    .font(.system(size: 32))
                                    .bold()
                                    .padding(.bottom)
                                    .padding(.leading)
                            }
                            VStack(alignment: .leading) {
                                Text("Vamos ver o que são ")
                                    .font(.custom("SofiaSans-Regular", size:20).weight(.heavy))
                                    .foregroundStyle(Color("MediumOrange"))
                                Text("TABLATURAS?")
                                    .font(.custom("SofiaSans-Regular", size:28).weight(.heavy))
                                    .foregroundStyle(Color("StrongOrange"))
                                
                                HStack{
                                    NavigationLink(destination: {
                                        ExplanationView()
                                    }, label: {
                                        Text("Iniciar")
                                            .bold()
                                            .padding()
                                            .foregroundStyle(.white)
                                            .frame(width: 114 , height: 35)
                                            .background(Color("StrongOrange"))
                                            .cornerRadius(10)
                                            .font(.custom("SofiaSans-Regular", size:14))
                                    })
                                    .padding(.bottom, 100)
                                    
                                    Image("Tabsy")
                                    
                                }
                                
//                                Button(action: {
//                                    seeAgainController.resetStagesFret(seeAgain: seeAgain)
//                                    vm.resetRetangulosCasas()
//                                }, label: {
//                                    Text("Resetar Fase Casas")
//                                })
//                                Button(action: {
//                                    seeAgainController.resetStagesString(seeAgain: seeAgain)
//                                    vm.resetRetangulos()
//                                }, label: {
//                                    Text("Resetar Fase Cordas")
//                                })
                                
                            }
                            .padding(.horizontal)
                            
                            

                            Text("Atividades")
                                .padding(.top)
                                .bold()
                                .padding(.horizontal, 20)
                                .font(.system(size:22))
                          
                            NavigationLink(destination: {
                                ExplanationView(homeView: $homeView)
                            }, label: {
                                Text("Iniciar")
                                    .bold()
                                    .padding()
                                    .foregroundStyle(.white)
                                    .frame(width: 114 , height: 35)
                                    .background(.orange)
                                    .cornerRadius(10)
                                    .font(.custom("SofiaSans-Regular", size:14))
                            })
                            .padding(.top)
                            
                            
                            VStack{
                                ForEach(0 ..< vm.cardsHome.count, id: \.self){ cardHome in
                                    VStack{
                                        if cardHome == 0{
                                            NavigationLink{
                                                StringView(context: context, seeAgain: seeAgain)
                                                
                                            }label: {
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
                                        else if cardHome == 1{
                                            NavigationLink{
                                                FretView(frets: $frets, context: context, seeAgain: seeAgain)
                                            }label: {
                                                if seeAgain.activitieDone < 1{
                                                    VStack{
                                                        Text("\(vm.cardsHome[cardHome].nome) (Faça Cordas antes!)")
                                                            .bold()
                                                            .foregroundStyle(.white)
                                                            .font(.custom("SofiaSans-Regular", size:21))
                                                            .padding(.trailing, 150)
                                                    }
                                                    .frame(width: 321 , height: 115 )
                                                    .background(.gray)
                                                    .cornerRadius(15)
                                                    .padding(.horizontal)
                                                    .padding(.bottom, 20)
                                                }
                                                else{
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
                                            .disabled(seeAgain.activitieDone < 1)
                                        }
                                        
                                        else if cardHome == 2{
                                            NavigationLink{
                                                //Banana
                                            }label: {
                                                if seeAgain.activitieDone < 2{
                                                    VStack{
                                                        Text("\(vm.cardsHome[cardHome].nome) (Faça CASAS antes!)")
                                                            .bold()
                                                            .foregroundStyle(.white)
                                                            .font(.custom("SofiaSans-Regular", size:21))
                                                            .padding(.trailing, 150)
                                                    }
                                                    .frame(width: 321 , height: 115 )
                                                    .background(.gray)
                                                    .cornerRadius(15)
                                                    .padding(.horizontal)
                                                    .padding(.bottom, 20)
                                                }
                                                else{
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
                                            .disabled(seeAgain.activitieDone < 2)
                                        }
                                    }
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
                }
            }
        }
    }
}

enum BounceHeight {
    case up100, up40, up10, base
    var associatedOffset: Double {
        switch self {
        case .up100:
            return -100
        case .up40:
            return -40
        case .up10:
            return -10
        case .base:
            return 0
        }
    }
}
//#Preview {
//    HomeView(homeView: .constant(true), context: NSManagedObjectContext(), tutorial: Tutorial(context: NSManagedObjectContext()))
//        .environmentObject(ViewModel())
//}
