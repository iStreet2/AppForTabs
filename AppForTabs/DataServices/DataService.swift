//
//  DataService.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 25/09/23.
//

import Foundation
import SwiftUI

class DataService{
    static var cardsHome: [CardsHome] = [
        CardsHome(nome: "CORDAS ", descricao: "Contagem e ordem das cordas", cor: .blue),
        CardsHome(nome: "CASAS", descricao: "Contagem e ordem das casas", cor: .pink),
        CardsHome(nome: "AFINAÇÃO", descricao:"afinacao",cor:  .green)
    ]
    
    
    
    static var retangulos: [DraggableItem] = [
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1,x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 1, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle2"), numero: "2", id: 2, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 2, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle3"), numero: "3", id: 3, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 3, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle4"), numero: "4", id: 4, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 4, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle5"), numero: "5", id: 5, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 5, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle6"), numero: "6", id: 6, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 6, x:54,y:54, linha: true, casa: false))
   
    ]
    
    static var retangulosII: [DraggableItem] = [
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1,x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 1, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle2"), numero: "2", id: 2, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 2, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle3"), numero: "3", id: 3, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 3, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle4"), numero: "4", id: 4, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 4, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle5"), numero: "5", id: 5, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 5, x:54,y:54, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle6"), numero: "6", id: 6, x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 6, x:54,y:54, linha: true, casa: false))
   
    ]
    static var retangulosIII: [DraggableItem] = [
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1,x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 1, x:47,y:47, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle2"), numero: "2", id: 2, x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 2, x:47,y:47, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle3"), numero: "3", id: 3, x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 3, x:47,y:47, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle4"), numero: "4", id: 4, x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 4, x:47,y:47, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle5"), numero: "5", id: 5, x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 5, x:47,y:47, linha: true, casa: false)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle6"), numero: "6", id: 6, x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: 6, x:47,y:47, linha: true, casa: false))
   
    ]
    static var retangulosCasas: [DraggableItem] = [
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1, x:59,y:100, linha: false, casa: true), destination: RectanglesModel(color: .gray, numero: "", id: 1, x:59,y:100 , linha: true,casa: true)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle2"), numero: "2", id: 2, x:59,y:100, linha: false,casa: true), destination: RectanglesModel(color: .gray, numero: "", id: 2, x:59,y:100, linha: true,casa: true)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle3"), numero: "3", id: 3, x:59,y:100, linha: false,casa: true), destination: RectanglesModel(color: .gray, numero: "", id: 3, x:59,y:100, linha: true,casa: true)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle4"), numero: "4", id: 4, x:59,y:100, linha: false,casa: true), destination: RectanglesModel(color: .gray, numero: "", id: 4, x:59,y:100, linha: true,casa: true)),
        DraggableItem(origin: RectanglesModel(color: Color("Rectangle5"), numero: "5", id: 5, x:59,y:100, linha: false,casa: true), destination: RectanglesModel(color: .gray, numero: "", id: 5, x:59,y:100, linha: true,casa: true))
    ]
}
