//
//  StringView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import Foundation
import SwiftUI
import CoreData

struct StageStringView: View {
    var id = UUID()
    @Binding var page: Int
    @State var sheetView = false
    @State var pop = false
    @State var scale = 0.5
    @State private var moving = false
    
    @State private var draggedItem: DraggableItem?
    
    @EnvironmentObject var vm: ViewModel
    
    @State var allTrue = 0
    
    
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init( page: Binding <Int>, context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self._page = page
    }
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            if page == 1{
                VStack{
                    
                    VStack{
                        ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                            vm.retangulos[i].destination
                                .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
                                .onChange(of:vm.retangulos[i].destination.color){
                                    allTrue += 1
                                    print("+1")
                                    if allTrue == vm.retangulos.count{
                                        sheetView.toggle()
                                    }
                                }
                            
                            
                            
                        }.padding()
                    }
                    
                    
                    HStack{
                        ForEach(0 ..< vm.retangulos.count/2, id: \.self){ i in
                            vm.retangulos[i].origin
                                .onDrag{
                                    self.draggedItem = vm.retangulos[i]
                                    return NSItemProvider()
                                }.padding(20)
                            
                        }
                    }
                    .padding(.trailing,40)
                    
                    HStack{
                        ForEach(vm.retangulos.count/2 ..< vm.retangulos.count, id: \.self){ i in
                            vm.retangulos[i].origin
                            
                                .onDrag{
                                    self.draggedItem = vm.retangulos[i]
                                    return NSItemProvider()
                                }.padding(20)
                            
                            
                        }
                    }
                    .padding(.leading,40)
                    
                    Spacer()
                }.sheet(isPresented: $sheetView){
                    CongratulationsSheetView(text1: "Você conseguiu!!",text2:"Uma tablatura possui 6 linhas, que representam as 6 cordas do violão.", context: context, seeAgain: seeAgain
                    )
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                }
                
                
        
                
                
                
            }else if page == 2{
                TesteView(context: context, seeAgain: seeAgain)
            }else if page == 3{
                
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
