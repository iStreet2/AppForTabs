//
//  SwiftUIViewII.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 03/10/23.
//

import Foundation
import SwiftUI
import CoreData

struct StringViewII: View {
    
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
                    Text("LINHAS")
                        .foregroundColor(.orange)
                }.font(.custom("SofiaSans-Regular", size:24))
                    .bold()
                ZStack{
                    Image ("CordaViolao")
                        .frame(width: 394, height: 108)
                        .padding()
                    VStack{
                        
                        ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                            Rectangle()
                                .frame(width: 390, height: 4)
                                .foregroundColor(vm.retangulos[vm.retangulos.count-1-i].destination.color)
                                .padding(.bottom, 4)
                            
                                
                        }
                    }.padding(.bottom, 3)
                }
                
                VStack{
                    ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                        vm.retangulos[i].destination
                            .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
                        
                        
                    }.padding(1)
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
