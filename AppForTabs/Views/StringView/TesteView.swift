//
//  TesteView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 06/10/23.
//

//import SwiftUI
//
//struct TesteView: View {
//    @State var linha = false
//    @State var attempts2:CGFloat = 0
//    var body: some View {
//        VStack{
//            VStack{
//                HStack{
//                    Text("Toque na")
//                    Text("CORDA DO VIOLÃO")
//                        .foregroundStyle(.accent)
//                }
//                Text(" indicada na tablatura")
//            }
//            .font(.custom("SofiaSans-Regular", size:24))
//            .bold()
//            .padding(25)
//            
//            
//            ZStack{
//                Image("ViolaoBraco")
//                VStack{
//                    ForEach(0 ..< 6, id: \.self){ i in
//                            Button {
//                                if i == 4{
//                                    linha = true
//                                    
//                                }
//                                else{
//                                    withAnimation(.default){
//                                        self.attempts2 += 1
//                                        simpleSuccess()
//                                    }
//                                }
//                            } label: {
//                                if linha == false && i == 4{
//                                    Rectangle()
//                                        .frame(width: 400, height: 5)
//                                        .padding(.bottom, 10)
//                                        .foregroundStyle(.clear)
//                                    
//                                }else if i == 4{
//                                    Rectangle()
//                                        .frame(width: 400, height: 5)
//                                        .padding(.bottom, 10)
//                                        .foregroundStyle(.accent)
//                                }
//                                else{
//                                    Rectangle()
//                                        .frame(width: 400, height: 5)
//                                        .padding(.bottom, 10)
//                                        .foregroundStyle(.clear)
//                                }
//                            }
//                        
//                    }
//                }
//            }
//            Image("TabLaranja")
//            
//        }
//        .modifier(Shake(animatableData: CGFloat(attempts2)))
//        Spacer()
//    }
//    
//    
//}

//#Preview {
//    TesteView()
//}
