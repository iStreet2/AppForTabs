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
    
    //Coisas do CoreData
    var tutorial: Tutorial
    @ObservedObject var tutorialController: TutorialController
    @Binding var homeView: Bool
    
    init(homeView: Binding <Bool>, context: NSManagedObjectContext, tutorial: Tutorial) {
        self.tutorialController = TutorialController(context: context)
        self.tutorial = tutorial
        self._homeView = homeView
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    HStack{
                        Text("Início")
                            .padding(.leading, 20)
                            .font(.system(size: 32))
                            .bold()
                        //                        Spacer()
                        Button(action: {
                            
                            tutorialController.enableTutorial(tutorial: tutorial)
                            bounceAnimation()
                            
                        }, label: {
                            
                            if tutorial.enabled == false{
                                
                                Text("Reativar tutorial!")
                                    .offset(y: bounceHeight?.associatedOffset ?? 0)
                            }
                            else{
                                Text("Tutorial Reativado!")
                                    .offset(y: bounceHeight?.associatedOffset ?? 0)
                            }
                        })
                    }
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
                        }
                        .padding(.top)
                    }
                    .padding(.trailing, 50)
                    .padding(.leading,25)
                    .padding(.vertical)
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
                                    StringView()
                                } label: {
                                    
                                    VStack{
                                        Text(vm.cardsHome[cardHome].nome)
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.custom("SofiaSans-Regular", size:21))
                                            .padding(.trailing, 150)
                                        
                                    }
                                    .frame(width: 321 , height: 115 )
                                    .padding(.horizontal,80)
                                    .padding(.vertical,30)
                                    .background(vm.cardsHome[cardHome].cor)
                                    .cornerRadius(15)
//                                    .padding(.horizontal)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        
        .onAppear{
            homeView = true
        }
    }
    func bounceAnimation() {
//        withAnimation(Animation.easeOut(duration: 0.3).delay(0)) {
//            bounceHeight = .up100
//        }
//        withAnimation(Animation.easeInOut(duration: 0.04).delay(0)) {
//            bounceHeight = .up100
//        }
//        withAnimation(Animation.easeIn(duration: 0.3).delay(0.34)) {
//            bounceHeight = .base
//        }
//        withAnimation(Animation.easeOut(duration: 0.2).delay(0.64)) {
//            bounceHeight = .up40
//        }
//        withAnimation(Animation.easeIn(duration: 0.2).delay(0.84)) {
//            bounceHeight = .base
//        }
        withAnimation(Animation.easeOut(duration: 0.1).delay(0)) {
            bounceHeight = .up10
        }
        withAnimation(Animation.easeIn(duration: 0.1).delay(0.14)) {
            bounceHeight = .none
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
