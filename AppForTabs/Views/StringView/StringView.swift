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
            Color("Background")
                .ignoresSafeArea()
            VStack{
                
                VStack{
                    ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                        vm.retangulos[i].destination
                            .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
                        
                        
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
            
        }
        draggedItem = nil
        return true
    }
}

//#Preview {
//    StringView()
//        .environmentObject(ViewModel())
//}
