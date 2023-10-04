//
//  testando.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 03/10/23.
//

import SwiftUI

struct testando: View {
    var body: some View {
        ZStack{
            Image("CordasTabs")
            VStack(spacing: 0){
                HStack{
                    Text("6")
                        .padding(.top, -20)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                } .padding(.trailing)
                HStack{
                    Text("6")
                        .padding(.top, -20)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                }
                    .padding(.trailing)
                HStack{
                    Text("6")
                        .padding(.top, -20)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                }.padding(.trailing)
                HStack{
                    Text("6")
                        .padding(.top, -20)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                }
                    .padding(.trailing)
                HStack{
                    Text("6")
                        .padding(.top, -20)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                }
                .padding(.trailing)
                HStack{
                    Text("6")
                        .padding(.top, -20)
                        
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 245, height: 4)
                        .background(Color(red: 0.45, green: 0.31, blue: 0.96))
                        .padding(.bottom, 21)
                }
                    .padding(.trailing, 10)
            }.padding(.top, 20)
        }
    }
}

#Preview {
    testando()
}
