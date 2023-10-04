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
    var x: CGFloat
    var y: CGFloat
    var linha: Bool
    var casa: Bool
   
  
    
    var body: some View{
        
        if casa{
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: x, height: y)
                    .background(color)
                    .cornerRadius(10)
                Text(numero)
                    .font(.custom("SofiaSans-Regular", size:30))
                    .bold()
            }
        }
        else{
            if linha == true{
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: x, height: y)
                            .background(color)
                            .cornerRadius(10)
                        Text(numero)
                            .foregroundColor(.white)
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
                        .frame(width: x, height: y)
                        .background(color)
                        .cornerRadius(10)
                    Text(numero)
                        .foregroundColor(.white)
                        .font(.custom("SofiaSans-Regular", size:30))
                        .bold()
                        
                }
            }
        }
    }
}

#Preview {
    RectanglesModel(color:Color(red: 1, green: 0.28, blue: 0.5) , numero: "1", id: 1, x: 54, y: 54,linha: true, casa: false)
}

