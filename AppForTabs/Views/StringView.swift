//
//  StringView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import SwiftUI

struct StringView: View {
    @State var pop = false
    @State var scale = 0.5
    @State var scaleXY = 1.0
    
    
    @State private var moving = false
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack{
            VStack{
                ForEach(0 ..< 10, id: \.self){ i in
                    Text("BIA SLAY muito")
                        .font(.custom("SofiaSans-Regular", size:60).weight(.heavy))
                }
                Spacer()
            }
            if pop{
                Color.gray
                    .ignoresSafeArea()
                    .opacity(0.4)
                ZStack{
                    VStack() {
                        HStack{
                            Text("ARRASTE")
                                .foregroundColor(.orange)
                            Text("OS ELEMENTOS")
                        }.padding(.top, 60)
                            .fontWeight(.black)
                            .font(.custom("SofiaSans-Regular", size:20))
                        Text( "ATÉ O PONTILHADO")
                            .fontWeight(.black)
                            .font(.custom("SofiaSans-Regular", size:20))
                            .multilineTextAlignment(.center)
                        
                        
                        VStack{
                            ZStack{
                                Group{
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 238, height: 324)
                                        .background(.white)
                                        .cornerRadius(16)
                                        .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.25), radius: 10, x: 0, y: 10)
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 214, height: 300)
                                        .background(Color(red: 0.97, green: 0.98, blue: 0.98))
                                        .cornerRadius(9)
                                       
                                    VStack{
                                        Rectangle()
                                            .stroke(style: StrokeStyle(lineWidth: 5, dash: [5]))
                                            .frame(width: 78, height: 78)
//                                            .border(.black, width: 4)
                                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                            .cornerRadius(7)
                                            .foregroundColor(.black)
                                            
                                        
                                        Image("maozinha")
                                            .offset(y:-40)
                                            .offset(y: moving ? 0 : 55)
                                            .padding(.leading, 53)
                                           
                                            .animation(.spring(response: 4.5, dampingFraction: 0, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
                                        
                                    }
                                    
                                    
                                    .onAppear{
                                        moving.toggle()
                                        
                                    }
                                    
                                    
                                    
                                    
                                }.padding(.bottom,70)
                                VStack{
                                    Spacer()
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 332, height: 108)
                                            .cornerRadius(16)
                                            .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5).opacity(0.2), radius: 10, x: 0, y: -10)
                                        HStack{
                                            Button(action: {
                                                withAnimation(){
                                                    scale = 0
                                                    
                                                    pop.toggle()
                                                }
                                                
                                                
                                            }, label: {
                                                
                                                Text("NÃO VER \n NOVAMENTE")
                                                    .foregroundColor(.gray)
                                                    .frame(width: 144 , height: 54)
                                                    .background(Color(red: 0.97, green: 0.98, blue: 0.98))
                                                    .cornerRadius(32)
                                                
                                                
                                                
                                            })
                                            .scaleEffect(scale)
                                            
                                            Button(action: {
                                                pop.toggle()
                                            }, label: {
                                                
                                                Text("OK")
                                                    .foregroundColor(.white)
                                                    .frame(width: 144 , height: 54)
                                                    .background(.orange)
                                                    .cornerRadius(32)
                                            })
                                            
                                        }
                                        .font(.custom("SofiaSans-Regular", size:14))
                                    }
                                }
                            }
                            
                        }
                        
                        
                    }
                    .frame(width: 332 , height: 542)
                    .background(Color(red: 0.97, green: 0.98, blue: 0.98))
                    .cornerRadius(15)
                    
                    
                }
                .scaleEffect(scale)
                .onAppear{
                    withAnimation() {
                        scale = 1
                    }
                }
                
            }
            
        }
        .onAppear{
            pop.toggle()
        }
    }
}

#Preview {
    StringView()
        .environmentObject(ViewModel())
}
