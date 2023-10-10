//
//  PageExplanationView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 05/10/23.
//

import SwiftUI

struct PageExplanationView: View {
    
    var id = UUID()
    @State var page: Int
    @State var scale = 0.1
    
    var body: some View {
        VStack{
            
            if page == 0{
                VStack(alignment: .leading){
                    Text("O que são?")
                        .font(.system(size: 32))
                        .frame(width: 300, height: 54, alignment: .topLeading)
                        .bold()
                    
                    
                    HStack {
                        Text("Tablaturas indicam")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                        Text("QUANDO")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color(.accent))
                        Text("e")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                    }
                    HStack{
                        Text("ONDE")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color(.accent))
                        Text("colocar os dedos para")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                    }
                    Text("gerar uma nota no instrumento.")
                        .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color("WeekOrange"))
                }
                .accessibilityElement(children: .combine)
                
            }else if page == 1{
                VStack(alignment: .leading){
                    Text("Instrumentos")
                        .font(.system(size: 32))
                        .frame(width: 300, height: 54, alignment: .topLeading)
                        .bold()
                    
                    
                    HStack {
                        Text("Geralmente são tocados")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                        
                        
                    }
                    Text("INSTRUMENTOS DE CORDAS")
                        .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color(.accent))
                    HStack{
                        Text("TRASTEADOS,")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color(.accent))
                        Text("como o violão e a")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                    }
                    Text("guitarra elétrica.")
                        .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color("WeekOrange"))
                }
                .accessibilityElement(children: .combine)
                
            }else if page == 2{
                VStack(alignment: .leading){
                    Text("Variações")
                        .font(.system(size: 32))
                        .frame(width: 300, height: 54, alignment: .topLeading)
                        .bold()
                
                    HStack {
                        Text("Dependendo do instrumento")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                        
                    }
                    HStack {
                        Text("sendo tocado, o")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color("WeekOrange"))
                        Text("NÚMERO DE")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color(.accent))
                    }
                    HStack{
                        Text("LINHAS")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color(.accent))
                        Text("ou")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                        Text("CORDAS")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color(.accent))
                        Text("da tablatura")
                            .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                            .foregroundStyle(Color("WeekOrange"))
                    }
                    Text("pode variar.")
                        .font(.custom("SofiaSans-Regular", size:24) .weight(.heavy))
                        .foregroundStyle(Color("WeekOrange"))
                }
                .accessibilityElement(children: .combine)
            }
            Spacer()
        }
    }
}

#Preview {
    PageExplanationView(page: 2)
}
