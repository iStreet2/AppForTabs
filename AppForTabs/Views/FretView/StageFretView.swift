//
//  StageFretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 02/10/23.
//

import SwiftUI

struct StageFretView: View, Identifiable {
    var id = UUID()
    @State var page: Int
    @State var pinkHouse = true
    @State var blueHouse = true
    @State var sheetView = false
    @State private var draggedItem: DraggableItem?
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        if page == 1{
            VStack{
                HStack{
                    Text("Toque nas")
                    Text("CASAS")
                        .foregroundStyle(.accent)
                }
                .font(
                    Font.custom("Sofia Sans", size: 24)
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
                CongratulationsSheetView(text1: "Boa!",text2:"O espaço entre dois trastes é chamado de Casa.", page: $page)
                    .presentationDetents([.fraction(0.286),.large])
                    .interactiveDismissDisabled()
            }
            .padding()
        }
        else if page == 2{
            VStack{
                VStack{
                    HStack{
                        Text("Complete as")
                        Text("CASAS")
                            .foregroundStyle(.accent)
                    }
                    Text("restantes")
                }
                .font(
                    Font.custom("Sofia Sans", size: 24)
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
                        
                    }
                }
                VStack{
//                    VStack{
//                        ForEach(0 ..< vm.retangulos.count, id: \.self){ i in
//                            vm.retangulos[i].destination
//                                .onDrop(of: [.text], delegate: DropViewDelegate(draggedItem: $draggedItem, destinationItem: $vm.retangulos[i]))
//                        }.padding()
//                    }
//                    
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
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StageFretView(page: 2)
}
