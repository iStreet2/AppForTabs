//
//  CongratulationsSheetView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 02/10/23.
//

import SwiftUI

struct CongratulationsSheetView: View {
    var text1: String
    var text2: String
    @Binding var page: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack(alignment:.leading){
            Group{
                Text(text1)
                    .font(.system(size:21).weight(.heavy))
                Text(text2)
            }
            .foregroundStyle(.accent)
            .padding()
            HStack{
                Spacer()
                Button(action: {
                    if page > 2 && page < 7{
                        dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            page+=1
                        }
                        
                    }
                    else{
                        withAnimation(.easeInOut){
                            dismiss()
                                page+=1
                        }
                    }
                },label: {
                    Text("Continuar")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 336)
                        .background(.accent)
                        .cornerRadius(24)
                })
                Spacer()
            }
            Spacer()
        }
        .background(Color("OrangeBackground"))
        
        
        
    }
}

#Preview {
    CongratulationsSheetView(text1: "Boa!", text2: "O espaço entre dois trastes é chamado de Casa.", page: .constant(1))
}
