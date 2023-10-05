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
    var body: some View {
        
        TabView(selection: $pageIndex){
            ForEach(page, id: \.self){ page in
                VStack{
                    ZStack{
                        
                        Color("OrangeBackground")
                            .ignoresSafeArea()
                        
                        //DESENHOS AQUI!!!!!!!!!
                        
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
                            Image("Casinha")
                            
                        })
                        .padding(.leading,200)
                    }
                    else{
                        Button(
                            action: {
                                incrementPage()
                            }
                            ,label: {
                                Image(systemName: "arrow.right.circle")
                                    .font(.system(size: 73))
                                
                            })
                        .padding(.leading,200)
                    }
                    Spacer()
                }
            }
            
        }
        .ignoresSafeArea()
        .background(Color("Background"))
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = .init(Color("Background"))
            dotAppearance.pageIndicatorTintColor = .init(Color("Background"))
        }
    }
    func incrementPage() {
        pageIndex += 1
    }
    
}

#Preview {
    ExplanationView(homeView: .constant(false))
}
