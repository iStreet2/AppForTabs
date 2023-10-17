//
//  PopUpView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 02/10/23.
//

import Foundation
import SwiftUI
import CoreData

struct PopUpView: View {

    @Binding var pop: Bool
    @State var scale = 0.5
    @State private var moving = false
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(pop: Binding<Bool>, context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self._pop = pop
    }
    
    var body: some View {
        
        Color.gray
            .ignoresSafeArea()
            .opacity(0.6)
        ZStack{
            ScrollView{
                VStack() {
                    VStack{
                        VStack{
                            Text("SEGURE E ARRASTE")
                                .foregroundStyle(Color("StrongOrange"))
                            Text("OS ELEMENTOS")
                        }
                        .padding(.top, 60)
                        .fontWeight(.heavy)
                        .font(.custom("SofiaSans-Regular", size:20))
                        Text("ATÉ O SOMBREADO")
                            .fontWeight(.heavy)
                            .font(.custom("SofiaSans-Regular", size:20))
                            .multilineTextAlignment(.center)
                    }
                    .accessibilityElement(children: .combine)
                    VStack{
                        ZStack{
                            Group{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 238, height: 324)
                                    .background(.white)
                                    .cornerRadius(16)
                                    .shadow(radius: 10, x: 0, y: 10)
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 214, height: 300)
                                    .background(Color(red: 0.97, green: 0.98, blue: 0.98))
                                    .cornerRadius(9)
                                
                                VStack{
                                    Rectangle()
                                        .stroke(style: StrokeStyle(lineWidth: 5, dash: [5]))
                                        .frame(width: 78, height: 78)
                                        .background(Color("Background3"))
                                        .cornerRadius(7)
                                        .foregroundColor(.black)
                                    Image("maozinha")
                                        .offset(y:-40)
                                        .offset(y: moving ? 0 : 55)
                                        .padding(.leading, 53)
                                        .animation(.spring(response: 4.5, dampingFraction: 0, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
                                        .accessibilityLabel("Animação que mostra uma mão arrastando o retângulo ate um espaço cinza")
                                    
                                }
                                .onAppear{
                                    moving.toggle()
                                }
                            }.padding(.bottom,70)
                            VStack{
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .foregroundStyle(Color("Background2"))
                                        .frame(width: 332, height: 108)
                                        .cornerRadius(15)
                                        .shadow(radius: 10, x: 0, y: -10)
                                    HStack{
                                        Button(action: {
                                            withAnimation{
                                                scale = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                                pop.toggle()
                                            }
                                            seeAgainController.disableSeeAgain(seeAgain: seeAgain)
                                            
                                        }, label: {
                                            
                                            Text("NÃO VER \n NOVAMENTE")
                                                .bold()
                                                .foregroundStyle(Color("Text"))
                                                .frame(minWidth: 144 , minHeight: 54)
                                                .background(Color("Background"))
                                                .cornerRadius(32)
                                            
                                        })
                                        
                                        Button(action: {
                                            withAnimation{
                                                scale = 0
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                                pop.toggle()
                                            }
                                        }, label: {
                                            Text("OK")
                                                .bold()
                                                .foregroundColor(.white)
                                                .frame(width: 144 , height: 54)
                                                .background(.orange)
                                                .cornerRadius(32)
                                        })
                                    }
                                    .font(.custom("SofiaSans-Regular", size:14))
                                }
                            }
                        }
                        
                    }
                }
            }
            .frame(width: 332 , height: 542)
            .background(Color("Background"))
            .cornerRadius(15)
            
            
        }
        .scaleEffect(scale)
        .onAppear{
            withAnimation() {
                scale = 1
            }
        }
    }
}

//#Preview {
//    PopUpView()
//}
