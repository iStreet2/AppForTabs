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
    var linha: Bool
  
    
    var body: some View{
        
        if linha == true{
            HStack{
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
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 225, height: 6)
                    .background(color)
                    .cornerRadius(10)
                
                
            }
        }
            else{
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
}

