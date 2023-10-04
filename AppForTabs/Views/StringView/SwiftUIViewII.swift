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
            
                        ForEach(0 ..< vm.retangulosII.count-1, id: \.self){ i in
                            Rectangle()
                                .frame(width: 390, height: 4)
                                .foregroundColor(vm.retangulosII[vm.retangulosII.count-1-i].destination.color)
                                .padding(.bottom, 4)
                            
                                
                        }
                        Rectangle()
                            .frame(width: 390, height: 4)
                            .foregroundColor(vm.retangulosII[0].origin.color)
                            .padding(.bottom, 4)
                    }.padding(.bottom, 3)
                }
                
                VStack{
                    vm.retangulos[0].destination
                    ForEach(1 ..< vm.retangulosII.count, id: \.self){ i in
                        vm.retangulosII[i].destination
                            .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulosII[i]))
//                            .onChange(of:vm.retangulosII[i].destination.color){
//                                allTrue += 1
//                                print("+1")
//                                if allTrue == vm.retangulosII.count{
//                                    sheetView.toggle()
//                                }
//                            }
                        
                        
                    }.padding(1)
                }.padding()
                
                
                HStack{
                    ForEach(1 ..< vm.retangulosII.count, id: \.self){ i in
                        vm.retangulosII[i].origin
                            .onDrag{
                                self.draggedItem = vm.retangulosII[i]
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
        
    }
}

struct DropViewDelegateII: DropDelegate{
    
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
