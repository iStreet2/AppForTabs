//
//  StringView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import Foundation
import SwiftUI
import CoreData

struct StringView: View {
    
    @State var pop = false
    @State var scale = 0.5
    @State var scaleXY = 1.0
    @State private var moving = false
    
    @State private var draggedItem: DraggableItem?
    
    @EnvironmentObject var vm: ViewModel
    

    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
    }
    
    var body: some View {
        ZStack{
            VStack{
                
                VStack{
                    
                    ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                        HStack{
                            vm.retangulos[i].destination
                                .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
                            
                        }
                    }.padding()
                }
                
                
                HStack{
                    ForEach(0 ..< vm.retangulos.count/2, id: \.self){ i in
                        vm.retangulos[i].origin
                            .onDrag{
                                self.draggedItem = vm.retangulos[i]
                                return NSItemProvider()
                            }.padding()
                        
                    }
                }
                .padding(.trailing,30)
                
                HStack{
                    ForEach(vm.retangulos.count/2 ..< vm.retangulos.count, id: \.self){ i in
                        vm.retangulos[i].origin
                            .onDrag{
                                self.draggedItem = vm.retangulos[i]
                                return NSItemProvider()
                            }.padding()
                            
                        
                    }
                }
                .padding(.leading,30)
                
                Spacer()

            }
            
            if pop{
                Color.gray
                    .ignoresSafeArea()
                    .opacity(0.4)
                ZStack{
                    VStack() {
                        VStack{
                            Text("SEGURE E ARRASTE")
                                .foregroundColor(.orange)
                            Text("OS ELEMENTOS")
                        }.padding(.top, 60)
                            .fontWeight(.black)
                            .font(.custom("SofiaSans-Regular", size:20))
                        Text( "ATÉ O SOMBREADO")
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
                                        //                                            .border(.black, width: 4)
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
                                                seeAgainController.disableSeeAgain(seeAgain:seeAgain)
                                                
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
            
        }.toolbar{
            Button(action: {
                pop.toggle()
                seeAgain.enabled = true
            }, label: {
                Image(systemName: "questionmark.circle")
                  
            })
        }
        .onAppear{
            if seeAgain.enabled{
                pop.toggle()
            }
        }
        
    }
}

struct DropViewDelegate: DropDelegate{
    
    @Binding var draggedItem: DraggableItem?
    @Binding var destinationItem: DraggableItem
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        if destinationItem.destination == draggedItem?.destination{
            destinationItem.destination.color = draggedItem?.origin.color ?? .black
            destinationItem.destination.numero = draggedItem?.origin.numero ?? " "
           
            withAnimation(.easeInOut){
                destinationItem.origin.color = Color("Background")
                destinationItem.origin.numero = ""
            }
            
        } else{
            destinationItem.destination.color = .gray
        }
        draggedItem = nil
        return true
    }
}

//#Preview {
//    StringView()
//        .environmentObject(ViewModel())
//}
