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
    @State var sheetView = false
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
            if seeAgain.stringActivitie == 1
            {
                ZStack{
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 358, height: 448)
                        .background(Color("GrayBackground"))
                        .cornerRadius(29)
                        .padding(.bottom,195)

                    VStack{
                        HStack{
                            Text("Numere as")
                            Text("LINHAS")
                                .foregroundStyle(.accent)
                        }
                        .font(
                            Font.custom("SofiaSans-Regular", size: 24)
                                .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        
                        VStack{
                            ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
                                vm.retangulos[i].destination
                                    .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
                                    .onChange(of:vm.retangulos[i].destination.color){
                                        vm.allTrueString += 1
                                        if vm.allTrueString == vm.retangulos.count{
                                            sheetView.toggle()
                                            vm.allTrueString = 0
                                        }
                                        
                                    }
                            }.padding(5)
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
                    }
                    .sheet(isPresented: $sheetView){
                        CongratulationsSheetView(text1: "Você conseguiu!!",text2:"Uma tablatura possui 6 linhas, que representam as 6 cordas do violão.", context: context, seeAgain: seeAgain
                        )
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                    }
                    
                }
                .padding(.top)
                
            }
            
            else if seeAgain.stringActivitie == 2
            {
                
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
                                .padding(1)
                            ForEach(1 ..< vm.retangulosII.count, id: \.self){ i in
                                vm.retangulosII[i].destination
                                    .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulosII[i]))
                                    .onChange(of:vm.retangulosII[i].destination.color){
                                        vm.allTrueString += 1
                                        print("+1")
                                        if vm.allTrueString == 5{
                                            sheetView.toggle()
                                            vm.allTrueString = 0
                                        }
                                    }
                                
                                
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
                }.sheet(isPresented: $sheetView){
                    CongratulationsSheetView(text1: "Você reparou?",text2:"A primeira linha na tablatura é a última corda no violão! ", context: context, seeAgain: seeAgain)
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                }
                
            }
            else if seeAgain.stringActivitie == 3{
                
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
                                
                                ForEach (0 ..< vm.retangulosIII.count-1, id: \.self){ i in
                                    HStack{
                                        Text(vm.retangulosIII[i].destination.numero)
                                            .padding(.top, -20)
                                            .foregroundColor(vm.retangulosIII[i].destination.color)
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 245, height: 4)
                                            .background(Color(vm.retangulosIII[i].destination.color))
                                            .padding(.bottom, 21)
                                            .padding(.trailing, 3)
                                    }.padding(.trailing, 15)
                                }
                                HStack{
                                    Text(vm.retangulosIII[5].origin.numero)
                                        .padding(.top, -20)
                                        .foregroundColor(vm.retangulosIII[5].origin.color)
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 245, height: 4)
                                        .background(Color(vm.retangulosIII[5].origin.color))
                                        .padding(.bottom, 20)
                                        .padding(.trailing, 3)
                                }.padding(.trailing, 15)
                            }.padding(.top, 21.5)
                        }
                        
                        ZStack{
                            Image("PedacoCorda")
                                .frame(width: 417, height: 318)
                            
                            VStack(spacing: 0){
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(vm.retangulosIII[5].origin.color)
                                        .frame(width: 399, height: 12)
                                    vm.retangulosIII[5].origin
                                        .padding(.bottom, 3)
                                        .padding(.leading, 60)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                ForEach(1 ..< vm.retangulosIII.count, id: \.self){ i in
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(vm.retangulosIII[vm.retangulosIII.count-1-i].destination.color)
                                            .frame(width: 399, height: 12)
                                        vm.retangulosIII[vm.retangulosIII.count-1-i].destination
                                            .padding(.bottom, 3)
                                            .padding(.leading, 60)
                                        
                                            .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulosIII[vm.retangulosIII.count-1-i]))
                                            .onChange(of:vm.retangulosIII[vm.retangulosIII.count-1-i].destination.color){
                                                vm.allTrueString += 1
                                                print("+1")
                                                if vm.allTrueString == 5{
                                                    sheetView.toggle()
                                                    vm.allTrueString = 0
                                                    vm.resetRetangulos()
                                                }
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        
                                        
                                        
                                    }
                                    
                                }
                            }.padding(.top, 8)
                                .padding(.bottom, 4)
                        }.padding()
                        
                        
                        
                        HStack{
                            ForEach(0 ..< vm.retangulosIII.count-1, id: \.self){ i in
                                vm.retangulosIII[i].origin
                                
                                    .onDrag{
                                        
                                        self.draggedItem = vm.retangulosIII[i]
                                        
                                        return NSItemProvider()
                                        
                                    }
                                
                                
                            }.padding( 1)
                        }
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    if pop{
                        PopUpView(pop:$pop,context:context,seeAgain:seeAgain)
                    }
                    
                }.sheet(isPresented: $sheetView){
                    CongratulationsSheetView(text1: "Boa!",text2:"No instrumento, as cordas são contadas de baixo para cima. ", context: context, seeAgain: seeAgain)
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                }
                
            }
            if pop{
                PopUpView(pop:$pop,context:context,seeAgain:seeAgain)
            }
            
        }
        //        .modifier(Shake(animatableData: CGFloat(attempts)))
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
