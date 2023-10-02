//
//  RectanglesModel.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 02/10/23.
//

import SwiftUI

struct RectanglesModel: View, Hashable{
    
    let uuid = UUID ()
    var color: Color
    var numero: String
    var id: Int
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 54, height: 54)
                .background(color)
                .cornerRadius(10)
            Text(numero)
                .font(.custom("SofiaSans-Regular", size:30))
                .bold()

        }
    }
}

#Preview {
    RectanglesModel(color: .pink, numero: "2", id: 2)
}
