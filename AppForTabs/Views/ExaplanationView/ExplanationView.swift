//
//  ExplanationView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 05/10/23.
//

import SwiftUI

struct ExplanationView: View {
    @State var pageIndex = 0
    private let dotAppearance = UIPageControl.appearance()
    private let page: [Int] = [0,1,2]
    @Binding var homeView: Bool
    @Environment(\.dismiss) var dismiss
    
    var labels = ["Uma imagem de uma mão segurando um braço de guitarra com cordas coloridas e com o mascote Tabsy em cima de seu pulso, sorrindo"," Uma imagem de varios intrumentos de cordas coloridos com varios Tabsy's sorrindo","Uma imaegm de uma guitarra azul de 6 cordas com fundo de multilplas quantidades de cordas diferente e o tabsy sorrindo"]
    var body: some View {
        
        TabView(selection: $pageIndex){
            
            ForEach(page, id: \.self){ page in
                
                VStack{
                    ZStack{
                        
                        Color("OrangeBackground")
                            .ignoresSafeArea()
                        
                        Image("Desenho\(page)",label: Text(labels[0]))
                            .resizable()
                            .ignoresSafeArea()
                            .accessibilityRemoveTraits(.isImage)
                            .accessibilityLabel(labels[page])
                            
                    }
                    
                    
                    
                    PageExplanationView(page: page)
                        .padding()
                    Spacer()
                    if pageIndex == 2{
                        Button(action: {
                            withAnimation{
                                dismiss()
                            }
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 29.5)
                                    .stroke(Color("AccentColor"), lineWidth: 1)
                                    .frame(width: 356, height: 55)
                                Text("TERMINAR")
                                    .font(.custom("SofiaSans-Regular", size:20))
                            }
                            
                        })
                        .padding(.bottom,40)
                    }
                    else{
                        Button(
                            action: {
                                incrementPage()
                            }
                            ,label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 29.5)
                                        .stroke(Color("AccentColor"), lineWidth: 1)
                                        .frame(width: 356, height: 55)
                                    Text("PRÓXIMO")
                                        .font(.custom("SofiaSans-Regular", size:20))
                                }
                                
                            })
                        .padding(.bottom,40)
                    }
                    Spacer()
                }
            }
            
        }
        .padding(.bottom)
        .ignoresSafeArea()
        .background(Color("Background"))
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = .init(.accentColor)
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    func incrementPage() {
        pageIndex += 1
    }
    
}

#Preview {
    ExplanationView(homeView: .constant(false))
}
