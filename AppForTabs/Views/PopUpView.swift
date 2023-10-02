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
            .opacity(0.4)
        ZStack{
            VStack() {
                HStack{
                    Text("ARRASTE")
                        .foregroundColor(.orange)
                    Text("OS ELEMENTOS")
                }.padding(.top, 60)
                    .fontWeight(.black)
                    .font(.custom("SofiaSans-Regular", size:20))
                Text( "ATÉ O PONTILHADO")
                    .fontWeight(.black)
                    .font(.custom("SofiaSans-Regular", size:20))
                    .multilineTextAlignment(.center)
                VStack{
                    ZStack{
                        Group{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 238, height: 324)
                                .background(.white)
                                .cornerRadius(16)
                                .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 10, x: 0, y: 10)
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 214, height: 300)
                                .background(Color(red: 0.97, green: 0.98, blue: 0.98))
                                .cornerRadius(9)
                            
                            VStack{
                                Rectangle()
                                    .stroke(style: StrokeStyle(lineWidth: 5, dash: [5]))
                                    .frame(width: 78, height: 78)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(7)
                                    .foregroundColor(.black)
                                Image("maozinha")
                                    .offset(y:-40)
                                    .offset(y: moving ? 0 : 55)
                                    .padding(.leading, 53)
                                
                                    .animation(.spring(response: 4.5, dampingFraction: 0, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
                                
                            }
                            .onAppear{
                                moving.toggle()
                            }
                        }.padding(.bottom,70)
                        VStack{
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 332, height: 108)
                                    .cornerRadius(16)
                                    .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.2), radius: 10, x: 0, y: -10)
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
                                            .foregroundColor(.gray)
                                            .frame(width: 144 , height: 54)
                                            .background(Color(red: 0.97, green: 0.98, blue: 0.98))
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
            .frame(width: 332 , height: 542)
            .background(Color(red: 0.97, green: 0.98, blue: 0.98))
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