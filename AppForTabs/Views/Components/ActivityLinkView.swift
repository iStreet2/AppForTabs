//
//  ActivityLinkView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 10/10/23.
//

import SwiftUI

struct ActivityLinkView: View {
    let text: String
    let color: Color
    let locked: Bool
    
    var body: some View {
        if locked {
            ZStack{
                Rectangle()
                    .fill(Color("BlockedRectangle"))
                    .cornerRadius(18)
                HStack{
                    Text(text)
                        .bold()
                        .foregroundStyle(.white)
                        .font(.custom("SofiaSans-Regular", size:21))
                    Spacer()
                    Image(systemName: "lock.fill")
                        .font(.system(size:40))
                }
                .padding()
            }
            .frame(minWidth: 321, minHeight: 115)
        } else {
            ZStack{
                Rectangle()
                    .fill(color)
                    .cornerRadius(18)
                HStack{
                    Text(text)
                        .bold()
                        .foregroundStyle(.white)
                        .font(.custom("SofiaSans-Regular", size:21))
                    Spacer()
                }
                .padding()
            }
            .frame(minWidth: 321, minHeight: 115)
            .accessibilityLabel("Atividade de \(text)")
        }
    }
}

#Preview {
    VStack {
        ActivityLinkView(text: "CORDAS", color: .blue, locked: false)
        ActivityLinkView(text: "CASAS", color: .pink, locked: false)
        ActivityLinkView(text: "AFINAçÃO", color: .red, locked: true)
    }
}
