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
    @State var fretOnTablature = false
    
    
    @State var attempts: Int = 0 //Para animação de tremer
    
    
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
            //PAGINA 1 COM A PRIMEIRA ATIVIDADE
            if seeAgain.fretActivitie == 1{
                ScrollView{
                    VStack{
                        Group{
                            Text("Toque nas ")
                            + Text("CASAS")
                                .foregroundColor(.accent)
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
                                .accessibilityLabel("Braço de um violão")
                            
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
                                            .accessibilityLabel("Casa Rosa")
                                        
                                    }
                                    else{
                                        Image("PinkRectangle")
                                            .padding(.leading,30)
                                            .padding(.top,10)
                                            .accessibilityLabel("Espaço Rosa")
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
                                            .accessibilityLabel("Casa Azul")
                                    }else{
                                        Image("BlueRectangle")
                                            .padding(.trailing,30)
                                            .padding(.top,10)
                                            .accessibilityLabel("Espaço Azul")
                                    }
                                    
                                })
                                .frame(width:200)
                                
                            }
                        }
                        Spacer()
                    }
                }
                .sheet(isPresented: $sheetView) {
                    CongratulationsSheetView(text1: "Boa!",text2:"O espaço entre dois trastes é chamado de Casa.",type: "Fret", context: context, seeAgain: seeAgain)
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                        .presentationDragIndicator(.hidden)
                }
                .padding()
            }
            
            
            
            //PAGINA 2 COM A 2 ATIVIDADE
            else if seeAgain.fretActivitie == 2{
                ScrollView{
                    ZStack{
                        VStack{
                            VStack{
                                Group{
                                    Text("Numere as ")
                                    + Text("CASAS")
                                        .foregroundColor(.accent)
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
                                    .frame(minWidth:410)
                                    .accessibilityLabel("Braço de um violão")
                                
                                HStack(spacing: 0){
                                    ForEach(0 ..< vm.retangulosCasas.count, id: \.self){ i in
                                        vm.retangulosCasas[vm.retangulosCasas.count - 1 - i].destination
                                            .accessibilityLabel("Casa de número \(vm.retangulosCasas.count - i)")
                                            .padding(.horizontal,6)
                                            .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulosCasas[vm.retangulosCasas.count - 1 - i]))
                                            .onChange(of:vm.retangulosCasas[vm.retangulosCasas.count - 1 - i].destination.color){ color in
                                                vm.allTrueFret += 1
                                                if vm.allTrueFret == 4{
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
                                                self.attempts += 1
                                                simpleSuccess()
                                                return NSItemProvider()
                                            }
                                            .padding()
                                            .accessibilityLabel("Casa de número \(i+1)")
                                        
                                    }
                                }
                                .padding(.trailing,30)
                                
                                HStack{
                                    ForEach(vm.retangulosCasas.count/2 ..< vm.retangulosCasas.count, id: \.self){ i in
                                        vm.retangulosCasas[i].origin
                                            .onDrag{
                                                self.draggedItem = vm.retangulosCasas[i]
                                                self.attempts += 1
                                                simpleSuccess()
                                                return NSItemProvider()
                                            }
                                            .padding()
                                            .accessibilityLabel("Casa de número \(i+1)")
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
                                .presentationDragIndicator(.hidden)
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
                    }
                    
                }
                //PAGINA 3 COM 3 ATIVIDADE
            }else if seeAgain.fretActivitie == 3{
                    if vm.page3 == 1{
                        FretActivitieView(fret: 3, sheetView: $sheetView, attempts: $attempts)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            .sheet(isPresented: $sheetView) {
                                CongratulationsSheetView(text1: "Muito bem!",text2:"Você acertou a ordem dessa casa, agora vamos para a próxima.",type: "Fret", context: context, seeAgain: seeAgain)
                                    .presentationDetents([.fraction(0.286),.large])
                                    .interactiveDismissDisabled()
                            }
                    }else if vm.page3 == 2{
                        FretActivitieView(fret: 1, sheetView: $sheetView, attempts: $attempts)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            .sheet(isPresented: $sheetView) {
                                CongratulationsSheetView(text1: "Perfeito!",text2:"Você acertou a ordem dessa casa, agora vamos para a próxima.",type: "Fret", context: context, seeAgain: seeAgain)
                                    .presentationDetents([.fraction(0.286),.large])
                                    .interactiveDismissDisabled()
                            }
                    }else if vm.page3 == 3{
                        FretActivitieView(fret: 5, sheetView: $sheetView, attempts: $attempts)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            .sheet(isPresented: $sheetView) {
                                CongratulationsSheetView(text1: "Continue assim!",text2:"Você está quase acabando, falta pouco. Mantenha o foco.",type: "Fret", context: context, seeAgain: seeAgain)
                                    .presentationDetents([.fraction(0.286),.large])
                                    .interactiveDismissDisabled()
                            }
                    }else if vm.page3 == 4{
                        FretActivitieView(fret: 2, sheetView: $sheetView, attempts: $attempts)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            .sheet(isPresented: $sheetView) {
                                CongratulationsSheetView(text1: "Excelente!",text2:"Falta só mais uma casa.",type: "Fret", context: context, seeAgain: seeAgain)
                                    .presentationDetents([.fraction(0.286),.large])
                                    .interactiveDismissDisabled()
                            }
                    }else if vm.page3 == 5{
                        FretActivitieView(fret: 4, sheetView: $sheetView, attempts: $attempts)
                            .modifier(Shake(animatableData: CGFloat(attempts)))
                            .sheet(isPresented: $sheetView) {
                                CongratulationsSheetView(text1: "Você conseguiu!",text2:"Parabéns, você concluiu a tarefa com sucesso.",type: "Fret", context: context, seeAgain: seeAgain)
                                    .presentationDetents([.fraction(0.286),.large])
                                    .interactiveDismissDisabled()
                            }
                    }
            }else if seeAgain.fretActivitie == 4{
                ScrollView{
                    VStack{
                        VStack{
                            Group{
                                Group{
                                    Text("Toque no violão a ")
                                    + Text("CASA")
                                        .foregroundColor(.accent)
                                }
                                Text("indicada na tablatura")
                            }
                            .font(
                                Font.custom("Sofia Sans", size: 24)
                                    .weight(.heavy)
                            )
                            .multilineTextAlignment(.center)
                        }
                        .accessibilityElement(children:.combine)
                        Spacer()
                        ZStack{
                            Image("GuitarArm2")
                                .accessibilityLabel("Braço de violão")
                            HStack{
                                ForEach(0 ..< 3, id: \.self) { i in
                                    Button(action: {
                                        if i == 2{
                                            withAnimation(.easeIn){
                                                fretOnTablature = true
                                                sheetView.toggle()
                                            }
                                        }else{
                                            withAnimation(.default){
                                                self.attempts+=1
                                                simpleSuccess()
                                            }
                                        }
                                    }, label: {
                                        if fretOnTablature && i == 2{
                                            ZStack{
                                                Rectangle()
                                                    .foregroundColor(.clear)
                                                    .frame(width: 95, height: 109)
                                                    .background(.pink)
                                                    .cornerRadius(10)
                                                Text("1")
                                                    .foregroundStyle(.white)
                                                    .font(.custom("SofiaSans-Regular", size:30))
                                                    .bold()
                                            }
                                            
                                        }else{
                                            Image("Pontilhado")
                                                .accessibilityLabel("Casa de número \(3 - i)")
                                        }
                                        
                                    })
                                }
                                .padding(.top)
                            }
                            .padding(.trailing,60)
                        }
                        Image("TablatureActivity")
                            .padding(.bottom,100)
                        
                    }
                }
                .sheet(isPresented: $sheetView) {
                    CongratulationsSheetView(text1: "Boa!",text2:"As casas são contadas a partir da cabeça do violão.",type: "Fret", context: context, seeAgain: seeAgain)
                        .presentationDetents([.fraction(0.286),.large])
                        .interactiveDismissDisabled()
                        .presentationDragIndicator(.hidden)
                }
                .modifier(Shake(animatableData: CGFloat(attempts)))
            }
            else if seeAgain.fretActivitie == 5{
                CongratulationsView(context: context, seeAgain: seeAgain, type: "Fret")
            }
            if pop{
                PopUpView(pop:$pop,context:context,seeAgain:seeAgain)
                    .ignoresSafeArea()
                    .frame(maxHeight:.infinity)
            }
            
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

//#Preview {
//    StageFretView(seeAgain.fretActivitie: 2)
//}
