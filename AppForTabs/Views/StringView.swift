//
//  StringView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import SwiftUI

struct StringView: View {
    @State var pop = false
    
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
                PageView(page:0)
                    .padding()
                    .cornerRadius(50)
                Button(action: {
                    pop.toggle()
                }, label: {
                    Text("Button")
                })
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
