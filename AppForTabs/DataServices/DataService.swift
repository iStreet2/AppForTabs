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
        DraggableItem(origin: RectanglesModel(color: Color(red: 1, green: 0.28, blue: 0.5), numero: "1", id: 1), destination: RectanglesModel(color: .gray, numero: "", id: 1)),
        DraggableItem(origin: RectanglesModel(color: Color(red: 1, green: 0.5, blue: 0.22), numero: "2", id: 2), destination: RectanglesModel(color: .gray, numero: "", id: 2)),
        DraggableItem(origin: RectanglesModel(color: Color(red: 1, green: 0.86, blue: 0), numero: "3", id: 3), destination: RectanglesModel(color: .gray, numero: "", id: 3)),
        DraggableItem(origin: RectanglesModel(color: Color(red: 0.01, green: 0.83, blue: 0.26), numero: "4", id: 4), destination: RectanglesModel(color: .gray, numero: "", id: 4)),
        DraggableItem(origin: RectanglesModel(color: Color(red: 0, green: 0.83, blue: 1), numero: "5", id: 5), destination: RectanglesModel(color: .gray, numero: "", id: 5)), 
        DraggableItem(origin: RectanglesModel(color: Color(red: 0.45, green: 0.31, blue: 0.96), numero: "6", id: 6), destination: RectanglesModel(color: .gray, numero: "", id: 6)),
   
    ]
}
