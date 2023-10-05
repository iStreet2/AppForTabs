//
//  StageFretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 02/10/23.
//

import SwiftUI
import CoreData

struct StageFretView: View, Identifiable {
    var id = UUID()
    @State var pinkHouse = true
    @State var blueHouse = true
    @State var sheetView = false
    @State var pop = false
    @State private var draggedItem: DraggableItem?
    @EnvironmentObject var vm: ViewModel
    @Binding var frets: [Bool]
    
    
    @State var attempts: Int = 0 //Para animação de tremer

    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(frets: Binding<[Bool]>,context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self._frets = frets
    }
    
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            
            
            //PAGINA 1 COM A PRIMEIRA ATIVIDADE
            if seeAgain.fretActivitie == 1{
                VStack{
                    HStack{
                        Text("Toque nas")
                        Text("CASAS")
                            .foregroundStyle(.accent)
                    }
                    .font(
                        Font.custom("SofiaSans-Regular", size: 24)
                            .weight(.heavy)
                    )
                    .multilineTextAlignment(.center)
                    Spacer()
                    ZStack{
                        Image("NoHouse")
                            .resizable()
                            .scaledToFit()
                            .frame(width:390)
                        HStack(spacing: 0){
                            Button(action: {
                                withAnimation(.easeInOut){
                                    pinkHouse.toggle()
                                    if pinkHouse == false && blueHouse == false{
                                        sheetView.toggle()
                                    }
                                }
                            }, label: {
                                if pinkHouse{
                                    Image("PinkHouse")
                                        .padding(.leading)
                                    
                                }
                                else{
                                    Image("PinkRectangle")
                                        .padding(.leading,30)
                                        .padding(.top,10)
                                }
                            })
                            .frame(width:200)
                            Button(action: {
                                withAnimation(.easeInOut){
                                    blueHouse.toggle()
                                    if pinkHouse == false && blueHouse == false{
                                        sheetView.toggle()
                                    }
                                }
                            }, label: {
                                if blueHouse{
                                    Image("BlueHouse")
                                        .padding(.trailing)
                                }else{
                                    Image("BlueRectangle")
                                        .padding(.trailing,30)
                                        .padding(.top,10)
                                }
                                
                            })
                            .frame(width:200)
                            
                        }
                    }
                    Spacer()
                }
                .sheet(isPresented: $sheetView) {
                    CongratulationsSheetView(text1: "Boa!",text2:"O espaço entre dois trastes é chamado de Casa.",type: "Fret", context: context, seeAgain: seeAgain)
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                }
                .padding()
            }
            
            
            
            //PAGINA 2 COM A 2 ATIVIDADE
            else if seeAgain.fretActivitie == 2{
                ZStack{
                    
                    VStack{
                        VStack{
                            HStack{
                                Text("Numere as")
                                Text("CASAS")
                                    .foregroundStyle(.accent)
                            }
                        }
                        .font(
                            Font.custom("SofiaSans-Regular", size: 24)
                                .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        Spacer()
                        
                        ZStack{
                            Image("GuitarArm")
                                .resizable()
                                .scaledToFit()
                                .frame(width:390)
                            HStack(spacing: 0){
                                ForEach(0 ..< vm.retangulosCasas.count, id: \.self){ i in
                                    vm.retangulosCasas[vm.retangulosCasas.count - 1 - i].destination
                                        .padding(.horizontal,4)
                                        .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulosCasas[vm.retangulosCasas.count - 1 - i]))
                                        .onChange(of:vm.retangulosCasas[vm.retangulosCasas.count - 1 - i].destination.color){
                                            vm.allTrueFret += 1
                                            if vm.allTrueFret == vm.retangulosCasas.count{
                                                sheetView.toggle()
                                            }
                                        }
                                }
                                
                            }
                            .padding(.trailing,13)
                            .padding(.bottom,20)
                            
                        }
                        VStack{
                            HStack{
                                ForEach(0 ..< vm.retangulosCasas.count/2, id: \.self){ i in
                                    vm.retangulosCasas[i].origin
                                        .onDrag{
                                            self.draggedItem = vm.retangulosCasas[i]
                                            return NSItemProvider()
                                        }.padding()
                                    
                                }
                            }
                            .padding(.trailing,30)
                            
                            HStack{
                                ForEach(vm.retangulosCasas.count/2 ..< vm.retangulosCasas.count, id: \.self){ i in
                                    vm.retangulosCasas[i].origin
                                        .onDrag{
                                            self.draggedItem = vm.retangulosCasas[i]
                                            return NSItemProvider()
                                        }.padding()
                                }
                            }
                            .padding(.leading,30)
                            
                            Spacer()
                            
                            
                        }
                        Spacer()
                        
                    }
                    .sheet(isPresented: $sheetView) {
                        CongratulationsSheetView(text1: "Boa!",text2:"As casas são contadas a partir da cabeça do violão.",type: "Fret", context: context, seeAgain: seeAgain)
                            .presentationDetents([.fraction(0.286),.large])
                            .interactiveDismissDisabled()
                    }
                    .padding()
                    .onAppear{
                        if seeAgain.enabled{
                            pop.toggle()
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
                    
                    if pop{
                        PopUpView(pop:$pop,context:context,seeAgain:seeAgain)
                            .ignoresSafeArea()
                            .frame(maxHeight:.infinity)
                    }
                }
                
                
                //PAGINA 3 COM 3 ATIVIDADE
            }else if seeAgain.fretActivitie == 3{
                
                if vm.page3 == 1{
                    FretActivitieView(frets: $frets, fret: 3, sheetView: $sheetView, attempts: $attempts)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                        .sheet(isPresented: $sheetView) {
                            CongratulationsSheetView(text1: "Muito bem!",text2:"Você acertou a ordem dessa casa, agora vamos para a próxima.",type: "Fret", context: context, seeAgain: seeAgain)
                                .presentationDetents([.fraction(0.286),.large])
                                .interactiveDismissDisabled()
                        }
                }else if vm.page3 == 2{
                    FretActivitieView(frets: $frets, fret: 1, sheetView: $sheetView, attempts: $attempts)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                        .sheet(isPresented: $sheetView) {
                            CongratulationsSheetView(text1: "Perfeito!",text2:"Você acertou a ordem dessa casa, agora vamos para a próxima.",type: "Fret", context: context, seeAgain: seeAgain)
                                .presentationDetents([.fraction(0.286),.large])
                                .interactiveDismissDisabled()
                        }
                }else if vm.page3 == 3{
                    FretActivitieView(frets: $frets, fret: 5, sheetView: $sheetView, attempts: $attempts)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                        .sheet(isPresented: $sheetView) {
                            CongratulationsSheetView(text1: "Continue assim!",text2:"Você está quase acabando, falta pouco. Mantenha o foco.",type: "Fret", context: context, seeAgain: seeAgain)
                                .presentationDetents([.fraction(0.286),.large])
                                .interactiveDismissDisabled()
                        }
                }else if vm.page3 == 4{
                    FretActivitieView(frets: $frets, fret: 2, sheetView: $sheetView, attempts: $attempts)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                        .sheet(isPresented: $sheetView) {
                            CongratulationsSheetView(text1: "Excelente!",text2:"Falta só mais uma casa.",type: "Fret", context: context, seeAgain: seeAgain)
                                .presentationDetents([.fraction(0.286),.large])
                                .interactiveDismissDisabled()
                        }
                }else if vm.page3 == 5{
                    FretActivitieView(frets: $frets, fret: 4, sheetView: $sheetView, attempts: $attempts)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                        .sheet(isPresented: $sheetView) {
                            CongratulationsSheetView(text1: "Você conseguiu!",text2:"Parabéns, você concluiu a tarefa com sucesso.",type: "Fret", context: context, seeAgain: seeAgain)
                                .presentationDetents([.fraction(0.286),.large])
                                .interactiveDismissDisabled()
                        }
                }
            }
            else if seeAgain.fretActivitie == 4{
                ZStack{
                    Color.gray
                        .ignoresSafeArea()
                        .opacity(0.6)
                    
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 323, height: 294)
                    .background(Color("WeekOrange"))
                    .cornerRadius(30)
                    
                    Text("Agora vamos\n revisar o conteúdo e ver\n como isso se aplica com a\n tablatura ?")
                        .font(
                        Font.custom("SofiaSans-Regular", size: 24)
                        .weight(.heavy)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("StrongOrange"))
                }
                .onAppear{
                    seeAgainController.increaseOneActivitie(seeAgain: seeAgain)
                }
            }
            
        }
    }
}

//#Preview {
//    StageFretView(seeAgain.fretActivitie: 2)
//}
