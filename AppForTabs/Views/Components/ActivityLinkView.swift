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
                        .multilineTextAlignment(.leading)
                        .bold()
                        .foregroundStyle(.white)
                        .font(.custom("SofiaSans-Regular", size:21).weight(.heavy))
                    Spacer()
                    Image(systemName: "lock.fill")
                        .font(.system(size:40))
                }
                .padding()
                .padding(.horizontal)
            }
            .accessibilityLabel("Atividade de \(text) ainda bloqueada, realizar a atividade anterior")
        } else {
            ZStack{
                Rectangle()
                    .fill(color)
                    .cornerRadius(18)
                HStack{
                    Text(text)
                        .bold()
                        .foregroundStyle(.white)
                        .font(.custom("SofiaSans-Regular", size:21).weight(.heavy))
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
            }
            .accessibilityLabel("Atividade de \(text)")
        }
    }
}

#Preview {
    VStack {
        ActivityLinkView(text: "CORDAS", color: .blue, locked: false)
        ActivityLinkView(text: "CASAS", color: .pink, locked: false)
        ActivityLinkView(text: "AFINAçÃO (Sairá em Breve)", color: .red, locked: true)
    }
}
