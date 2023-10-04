//
//  SwiftUIViewII.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 03/10/23.
//

import Foundation
import SwiftUI
import CoreData

struct TesteView: View {
    
    @State var pop = false
    @State var scale = 0.5
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
                HStack{
                    Text("Numere as ")
                    Text("CORDAS")
                        .foregroundColor(.orange)
                }.font(.custom("SofiaSans-Regular", size:24))
                    .bold()
                    .padding()
                ZStack{
                    Image("CordasTabs")
                    VStack(spacing: 0){
                        
                        ForEach (0 ..< vm.retangulos.count, id: \.self){ i in
                            HStack{
                                Text(vm.retangulos[i].destination.numero)
                                    .padding(.top, -20)
                                    .foregroundColor(vm.retangulos[i].destination.color)
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 245, height: 4)
                                    .background(Color(vm.retangulos[i].destination.color))
                                    .padding(.bottom, 21)
                                    .padding(.trailing, 3)
                            }.padding(.trailing, 15)
                        }
                    }.padding(.top, 21.5)
                }
                
                ZStack{
                        Image("PedacoCorda")
                            .frame(width: 417, height: 318)
                        
                        VStack(spacing: 0){

                            ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(vm.retangulos[vm.retangulos.count-1-i].destination.color)
                                        .frame(width: 399, height: 12)
                                    vm.retangulos[vm.retangulos.count-1-i].destination
                                        .padding(.bottom, 3)
                                        .padding(.leading, 60)
                                        
                                        .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[vm.retangulos.count-1-i]))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        
                                    
                                    
                                }
                                
                            }
                        }.padding(.top, 8)
                        .padding(.bottom, 4)
                }.padding()
                    
                    
                    
                    HStack{
                        ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                            vm.retangulos[i].origin
                                
                                .onDrag{
                                   
                                        self.draggedItem = vm.retangulos[i]
                                     
                                    return NSItemProvider()
                                   
                                }
                            
                            
                        }.padding( 1)
                    }
                    
                    
                    Spacer()
                    
                    
                    
                }
                if pop{
                    PopUpView(pop:$pop,context:context,seeAgain:seeAgain)
                }
                
            }
            .toolbar{
                Button(action: {
                    pop.toggle()
                    seeAgainController.enableSeeAgain(seeAgain: seeAgain)
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

    
    //#Preview {
    //    StringView()
    //        .environmentObject(ViewModel())
    //}
