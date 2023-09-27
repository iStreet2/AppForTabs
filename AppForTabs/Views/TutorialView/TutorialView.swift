//
//  tutorialScreen1.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct TutorialView: View {
    @State var pageIndex = 0
    private let dotAppearance = UIPageControl.appearance()
    private let page: [Int] = [0,1,2,3,4,5]
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(page, id: \.self){ page in
                VStack{
                    PageView(page: page)
                        .padding()
                    if pageIndex == 5{
                        
                        Button(action: {
                            //ir para a tela HOME que a bia esta desenvolvendo
                        }, label: {
                            Text("COMEÇAR")
                                .font(.custom("SofiaSans-Regular", size:20))
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 29.5)
                                        .stroke(Color("AccentColor"), lineWidth: 1)
                                        .frame(width: 356, height: 55)
                                )
                        })
                        
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
                        .padding()
                    }
                    Spacer()
                }
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = .init(.accentColor)
            dotAppearance.pageIndicatorTintColor = .gray
            print("\(pageIndex)")
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    func decrementPage() {
        pageIndex -= 1
    }
    func goToZero(){
        pageIndex = 0
    }
}

#Preview {
    TutorialView()
}